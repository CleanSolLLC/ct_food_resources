class CreateFoodPantries < ActiveRecord::Migration[8.0]
  def change
    create_table :food_pantries do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :phone_ext
      t.string :contact
      t.boolean :verified
      t.integer :user_id
      t.references :town, null: false, foreign_key: true

      t.timestamps
    end
  end
end
