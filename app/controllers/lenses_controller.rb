# frozen_string_literal: true

class LensesController < ApplicationController
  before_action :logged_in_user, only: %i[show index add_usage]
  before_action :set_lens, only: %i[show add_usage]
  before_action :check_lens_ownership, only: %i[show add_usage]

  def show
    @usages = @lens.usages.order(usage_date: :desc)
  end

  def index
    user = current_user
    @lenses = Lens.joins(lens_type: :user).where(users: { id: user.id }, status: 'Active')
  end

  def add_usage
    Lens.transaction do
      now = Time.now

      Usage.create!(usage_days: 1, usage_date: now, lens: @lens)

      @lens.usage_days += 1
      @lens.last_usage_date = now
      @lens.save!
    end
    redirect_to lenses_path
  rescue ActiveRecord::RecordInvalid => e
    # Обработка ошибок в случае, если транзакция не удалась
    puts "Ошибка транзакции: #{e.message}"
  end

  def delete_usage
    lens = Lens.find(params[:id])
    usage = Usage.find(params[:format])
    if usage && usage.lens_id == lens.id
      lens.usage_days -= usage.usage_days
      usage.destroy
      lens.save
      flash[:success] = t('controllers.lenses.usage_deleted')
    else
      flash[:error] = t('controllers.lenses.delete_error')
    end
    redirect_to lens_path(lens)
  end


  private

  def set_lens
    @lens = Lens.find_by(id: params[:id])
    return unless @lens.nil?

    flash[:negative] = t('controllers.lenses.lens_not_found')
    redirect_to root_path
  end

  def check_lens_ownership
    return if @lens.lens_type.user == current_user

    flash[:negative] = t('controllers.lenses.prohibited')
    redirect_to root_path
  end
end
