json.extract! food_pantry, :id, :name, :address_line1, :address_line2, :city, :state, :zip_code, :phone_number, :contact, :verified, :comments, :town_id, :created_at, :updated_at
json.url food_pantry_url(food_pantry, format: :json)
