class FoodPantry < ApplicationRecord
  belongs_to :town
  has_many :comments
  accepts_nested_attributes_for :comments
end
