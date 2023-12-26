class LensTypesController < ApplicationController
  def index
    @lens_types = LensType.all
  end

  def select_lens
    @lens_type = LensType.find(params[:id])
    @new_lens = Lens.create(status: 'Active', usage_days: @lens_type.wearing_period, lens_type: @lens_type)
    redirect_to lense_path
  end
end
