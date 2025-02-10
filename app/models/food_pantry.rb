class FoodPantry < ApplicationRecord
  belongs_to :town
  has_many :comments
end
