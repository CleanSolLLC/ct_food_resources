class FoodPantriesController < ApplicationController
  before_action :set_food_pantry, only: %i[show edit update destroy]

  # GET /food_pantries or /food_pantries.json
  def index
    @food_pantries = FoodPantry.all
  end

  # GET /food_pantries/1 or /food_pantries/1.json
  def show
    @food_pantry = FoodPantry.includes(:comments, :town).find(params.require(:id))
    @comments = @food_pantry.comments
  end

  # GET /food_pantries/new
  def new
    @food_pantry = FoodPantry.new(town_id: params[:town_id])
    #binding.pry
    # @towns = Town.all
    # @food_pantry.comments.build
  end

  # GET /food_pantries/1/edit
  def edit
  end

  # POST /food_pantries or /food_pantries.json
  def create
    @food_pantry = FoodPantry.new(food_pantry_params)

    respond_to do |format|
      if @food_pantry.save
        format.html { redirect_to @food_pantry, notice: "Food pantry was successfully created." }
        format.json { render :show, status: :created, location: @food_pantry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_pantry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_pantries/1 or /food_pantries/1.json
  def update
    respond_to do |format|
      if @food_pantry.update(food_pantry_params)
        format.html { redirect_to @food_pantry, notice: "Food pantry was successfully updated." }
        format.json { render :show, status: :ok, location: @food_pantry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_pantry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_pantries/1 or /food_pantries/1.json
  def destroy
    @food_pantry.destroy!

    respond_to do |format|
      format.html { redirect_to food_pantries_path, status: :see_other, notice: "Food pantry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food_pantry
    @food_pantry = FoodPantry.find(params.require(:id))
  end

  # Only allow a list of trusted parameters through.
  def food_pantry_params
    params.expect(food_pantry: [ :name, :address_line1, :address_line2, :city, :state, :zip_code, :phone_number, :contact, :verified, :additional_info, :town_id, comments_attributes: [ :id, :comment, :_destroy ] ])
  end
end
