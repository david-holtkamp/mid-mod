require 'rails_helper'

feature 'User can search for an ingredient and return foods that contain it' do

  scenario 'User selects sweet potatoes from the search form' do

    visit '/'

    # within '.form-group search-field' do
      fill_in :q, with: 'sweet potatoes'
    # end

    click_on 'Search'

    expect(current_path).to eq('/foods')
    expect(page).to have_content('10 with sweet potatoes')

    expect(page).to have_css('.foods-from-search', count: 10)

    within(first('.foods-from-search')) do
      expect(page).to have_css(".gtinUpc")
      expect(page).to have_css(".description")
      expect(page).to have_css(".brandOwner")
      expect(page).to have_css(".ingredients")
    end
  end
end
# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search.
# Then I should see a list of ten foods that contain the ingredient "sweet potatoes"
# And for each of the foods I should see:
# - The food's GTIN/UPC code
# - The food's description
# - The food's Brand Owner
# - The food's ingredients

# https://api.nal.usda.gov/fdc/v1/
