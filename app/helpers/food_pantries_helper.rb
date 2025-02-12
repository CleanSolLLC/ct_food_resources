module FoodPantriesHelper
  def total_by_county(towns)
    count = 0
    towns.each do |town|
      count += town.food_pantries.count
    end
    count
  end
end
