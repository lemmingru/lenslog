class LensTypesController < ApplicationController
  before_action :logged_in_user, only: %i[index]
  def index
    @lens_types = current_user.lens_types
  end

  def select_lens
    @lens_type = LensType.find(params[:id])
    @new_lens = Lens.create(status: 'Active', usage_days: 0, lens_type: @lens_type)
    redirect_to lens_path
  end
end
