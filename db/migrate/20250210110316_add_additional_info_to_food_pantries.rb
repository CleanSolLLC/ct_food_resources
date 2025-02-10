class AddAdditionalInfoToFoodPantries < ActiveRecord::Migration[8.0]
  def change
    add_column :food_pantries, :additional_info, :string
  end
end
