class FoodService

  def initialize(search_params)
    @ingredient = search_params[:q]
  end

  def get_foods_by_ingredient
    get_json
  end


  private

    def get_json
      response = conn.get
      json_response = JSON.parse(response.body, symbolize_names: true)[:foods]
    end

    def conn
      Faraday.new(url: 'https://api.nal.usda.gov/fdc/v1/search/') do |faraday|
        faraday.params['api_key'] = ENV['FOOD_DATA_KEY']
        faraday.params['generalSearchInput'] = @ingredient
        faraday.adapter Faraday.default_adapter
    end
  end
end
