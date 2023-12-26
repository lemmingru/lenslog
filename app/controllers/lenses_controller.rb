class LensesController < ApplicationController
  def show
    @lens = Lens.find(params[:id])
  end


end
