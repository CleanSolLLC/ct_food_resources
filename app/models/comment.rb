class Comment < ApplicationRecord
  belongs_to :food_pantry
  belongs_to :user
end
