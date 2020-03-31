class Food
attr_reader :gtinupc, :description, :brandowner, :ingredients

  def initialize(attributes = {})
    @gtinupc = attributes[:gtinUpc]
    @description = attributes[:description]
    @brandowner = attributes[:brandOwner]
    @ingredients = attributes[:ingredients]
  end
end
