class CountiesController < ApplicationController
  include FoodPantryCounter
  before_action :set_county, only: %i[show]
  def index
    @counties = County.all
  end

  def show
    towns = @county.towns
    @towns_hash = towns_hash(towns)
    @total_by_county = total_by_county(towns)
  end


  def food_pantries
    @county = County.find(params[:id])
    @food_pantries = @county.towns.includes(:food_pantries)

    respond_to do |format|
      format.turbo_stream
      # format.html { render :food_pantries }
    end
  end

  private

  def set_county
    @county = County.find(params.require(:id))
  end
end
