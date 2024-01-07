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
    hours = params[:hours].to_i || 24
    Lens.transaction do
      now = Time.now

      Usage.create!(usage_hours: hours, usage_date: now, lens: @lens)

      @lens.usage_hours += hours
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
    usage = Usage.find(params[:usage_id])
    if usage && usage.lens_id == lens.id
      lens.usage_hours -= usage.usage_hours
      usage.destroy
      lens.last_usage_date = lens.usages.maximum(:usage_date)
      lens.save
      flash[:success] = t('controllers.lenses.usage_deleted')
    else
      flash[:error] = t('controllers.lenses.delete_error')
    end
    redirect_to lens_path(lens)
  end

  def destroy
    @lens = Lens.find(params[:id])
    if @lens.present? && (@lens.lens_type.user == current_user)
      @lens.status = 'Disposed'
      @lens.save
      flash[:success] = t('controllers.lenses.deleted')
    else
      flash[:error] = t('controllers.lenses.lens_delete_error')
    end
    redirect_to lenses_path
  end

  def change
    @lens = Lens.find(params[:id])
    @new_lens = Lens.new(status: 'Active', usage_hours: 0, lens_type: @lens.lens_type)
    if @new_lens.save
      @lens.status = 'Disposed'
      @lens.save
      flash[:success] = t('controllers.lenses.lens_changed')
    end
    redirect_to lenses_path
  end


  private

  def set_lens
    @lens = Lens.find_by(id: params[:id])
    return unless @lens.nil?

    flash[:error] = t('controllers.lenses.lens_not_found')
    redirect_to root_path
  end

  def check_lens_ownership
    return if @lens.lens_type.user == current_user

    flash[:error] = t('controllers.lenses.prohibited')
    redirect_to root_path
  end
end
