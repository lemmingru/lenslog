class LensTypesController < ApplicationController
  before_action :logged_in_user
  def index
    @lens_types = current_user.lens_types
  end

  def create
    @lens_type = current_user.lens_types.new(lens_type_params)
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
end
