class LensTypesController < ApplicationController
  before_action :logged_in_user
  def index
    @lens_types = current_user.lens_types.where(status: 'Active')
  end

  def create
    @lens_type = current_user.lens_types.new(lens_type_params)
    @lens_type.status = 'Active'
    if @lens_type.save
      flash[:info] = t('controllers.lens_types.created')
      redirect_to lens_types_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @lens_type = LensType.new
  end

  def select_lens
    @lens_type = current_user.lens_types.find(params[:id])
    @new_lens = Lens.create(status: 'Active', usage_hours: 0, lens_type: @lens_type)
    redirect_to lenses_path
  end

  def lens_type_params
    params.require(:lens_type).permit( :manufacturer, :prescription, :wearing_period)
  end

  def edit
    @lens_type = current_user.lens_types.find(params[:id])
  end

  def update
    @lens_type = current_user.lens_types.find(params[:id])
    if @lens_type.update(lens_type_params)
      flash[:positive] = t('controllers.lens_types.updated')
      redirect_to lens_types_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def delete_lens_type
    @lens_type = current_user.lens_types.find(params[:id])
    @lens_type.status = 'Deleted'
    if Lens.where(status: 'Active', lens_type_id: @lens_type.id).any? # Линзы данного типа еще используются
      flash[:error] = t('controllers.lens_types.delete_error')
    else
      @lens_type.save
      flash[:positive] = t('controllers.lens_types.deleted')
    end
    redirect_to lens_types_path
  end
end
