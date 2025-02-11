module FoodPantryCounter
  extend ActiveSupport::Concern

  def total_by_county(towns)
    count = 0
    towns.each do |town|
      count += town.food_pantries.count
    end
    count
  end

  def towns_hash(towns)
    towns_hash = {}
    towns.each do |town|
      towns_hash[town.name] = town.food_pantries.count
    end
    towns_hash
  end
end
