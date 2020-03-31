class FoodSearch

  def initialize(search_params)
    @service = FoodService.new(search_params)
  end

  def foods
    all_foods_by_search = @service.get_foods_by_ingredient.map do |food_data|
      Food.new(food_data)
    end
    first_10_containing_ingredient = all_foods_by_search[0..9]
  end
end
