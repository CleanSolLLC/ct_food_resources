# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

puts "Beginng CT counties and towns import ..."
require "smarter_csv"

path_to_towns_csv = Rails.root.join("towns.csv")

if File.exist?(path_to_towns_csv)
  SmarterCSV.process(path_to_towns_csv).each do |row|
    county = row[:county]
    town = row[:town]
    ct_county = County.find_or_create_by(name: county)
    ct_town = Town.find_or_create_by(name: town)
    ct_county.towns << ct_town unless ct_county.towns.include?(ct_town)
  end
  puts "Import of CT counties and towns complete!"
else
  puts "Error: File not found at #{path_to_towns_csv}"
end

puts "Seeding users..."
user1 = User.create!(
  email_address: "test@test.com",
  password: "password",
  user_name: "user_1"
)

user2 = User.create!(
  email_address: "test2@test.com",
  password: "password",
  user_name: "user_2"
)

user3 = User.create!(
  email_address: "test3@test.com",
  password: "password",
  user_name: "user_3"
)
puts "Seeding users complete!"

puts "Seeding food pantries..."
food_pantry_1 = FoodPantry.create!(
  name: "MACC Community Emergency Food Pantry",
  address_line1: "460 Main Street",
  address_line2: "",
  city: "Manchester",
  state: "CT",
  zip_code: "06040",
  phone_number: "860-647-8003",
  additional_info: "Verified by MACC staff 02-07-2025",
  verified: true,
  town_id: Town.find_by(name: "Manchester")&.id
)

food_pantry_1.comments << Comment.create!(
  body: "This pantry is open every Tuesday and Thursday from 10am to 1pm. It has dry and canned goods",
  user_id: user1.id,
  food_pantry_id: food_pantry_1.id
)

food_pantry_2 = FoodPantry.create!(
  name: "House of harvest",
  address_line1: "114 Wooster Street",
  address_line2: "",
  city: "Hartford",
  state: "CT",
  zip_code: "06120",
  phone_number: "860-477-8735",
  additional_info: "Need to verify hours of operation",
  verified: false,
  town_id: Town.find_by(name: "Hartford")&.id,
  user_id: user1.id
)
food_pantry_2.comments << Comment.create!(
  body: "Went on a Thursday, staff very kind and helpful. It has dry and canned goods and some produce",
  user_id: user1.id,
  food_pantry_id: food_pantry_2.id
)

food_pantry_3 = FoodPantry.create!(
  name: "Jewish Family Service of Greater New Haven Food Pantry",
  address_line1: "1440 Whalley Avenue",
  address_line2: "",
  city: "New Haven",
  state: "CT",
  zip_code: "06515",
  phone_number: "203-777-1111",
  additional_info: "Verified by United Way of Greater New Haven 02-07-2025",
  verified: true,
  town_id: Town.find_by(name: "New Haven")&.id
)
food_pantry_3.comments << Comment.create!(
  body: "Open every Wednesday and Thursday from 9am to 12pm. It has dry goods and dairy products",
  user_id: user2.id,
  food_pantry_id: food_pantry_3.id
)

food_pantry_4 = FoodPantry.create!(
  name: "Town of Woodbridge Emergency Food Pantry",
  address_line1: "4 Meetinghouse Lane",
  address_line2: "",
  city: "Woodbridge",
  state: "CT",
  zip_code: "06525",
  phone_number: "203-389-3429",
  additional_info: "",
  verified: false,
  town_id: Town.find_by(name: "Woodbridge")&.id,
  user_id: user3.id
)
food_pantry_4.comments << Comment.create!(
  body: "Open ever Monday through Friday from 8:30am to 4:30pm. I think it is only for town residents",
  user_id: user3.id,
  food_pantry_id: food_pantry_4.id
)

puts "Seeding food pantries complete!"
