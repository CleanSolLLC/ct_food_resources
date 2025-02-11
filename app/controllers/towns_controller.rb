class TownsController < ApplicationController
  before_action :set_towns, only: %i[show]
  def index
    @towns = Town.all
  end

  def show
  end

  private

  def set_towns
    @town = Town.find(params.require(:id))
  end
end
