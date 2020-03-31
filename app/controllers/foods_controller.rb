class FoodsController < ApplicationController

  def index
    render locals: {
      search_results: FoodSearch.new(search_params)
    }
  end


  private

    def search_params
      params.permit(:q)
    end
end
