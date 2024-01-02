class LensesController < ApplicationController
  before_action :logged_in_user, only: %i[show index]
  before_action :set_lens, only: [:show]
  before_action :check_lens_ownership, only: [:show]


  def show

  end

  def index
    # Предполагается, что у вас есть связи между моделями User, LensType и Lens

    # Получите текущего пользователя (замените на свой способ получения пользователя)
    user = current_user

    # Составьте запрос для получения всех линз пользователя с активным статусом
    @lenses = Lens.joins(lens_type: :user).where(users: { id: user.id }, status: 'Active')

  end

  private

  def set_lens
    @lens = Lens.find_by(id: params[:id])
    if @lens.nil?
      flash[:negative] = t('controllers.lenses.lens_not_found')
      redirect_to root_path
    end

  end

  def check_lens_ownership
    return if @lens.lens_type.user == current_user

    flash[:negative] = t('controllers.lenses.prohibited')
    redirect_to root_path

  end



end
