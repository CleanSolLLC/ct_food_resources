class TownsController < ApplicationController
  before_action :set_towns, only: %i[show]
  def index
    @towns = Town.all
  end

  def show
  end

  def food_pantries
    @town = Town.includes(:food_pantries).find(params[:id])
    @food_pantries = @town.food_pantries

    respond_to do |format|
      format.turbo_stream
      format.html { render :food_pantries }
    end
  end

  private

  def set_towns
    @town = Town.find(params.require(:id))
  end
end
