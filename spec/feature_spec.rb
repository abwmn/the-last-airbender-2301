require 'rails_helper'

RSpec.describe "Last Airbender Home and Search Pages", type: :feature do
  before { @service = AvatarService.new}

  describe "Home Page" do
    it 'has a select field for all four element nations' do
      visit root_path
      
      expect(page).to have_content("The Four Nations")
      expect(page).to have_content("Search For Members by their Nation")
      expect(page).to have_select("nation")
      select("Fire Nation", from: "nation")
      select("Air Nomads", from: "nation")
      select("Earth Kingdom", from: "nation")
      select("Water Tribes", from: "nation")
    end
  end

  feature "Search for Members by their Nation", :vcr do
    scenario "I search for fire members" do
      visit root_path
      select("Fire Nation", from: "nation")
      click_button "Search For Members"
      expect(current_path).to eq(search_path)

      expect(page).to have_content("Total Members: 97")

      within(".member_details") do
        within("#5cf5679a915ecad153ab68fd")
        expect(page).to have_content("Name: Chan (Fire Nation admiral)")
        expect(page).to have_content("Photo:")
        expect(page).to have_content("Allies: [\"Ozai\"]")
        expect(page).to have_content("Enemies: [\"Earth Kingdom\"]")
        expect(page).to have_content("Affiliation: Fire Nation Navy")
      end
    end
  end
end

# When I visit '/'
# And I select "Fire Nation" from the select field
# And I click "Search for members"
# Then I should be on the page "/search"
# And I should see the total number of people who live in the fire Nation (about 100)
# and i should see a list with the detailed information for the first 25 members of the fire nation.

# for each of these members i should see:
#   -the name of the member
#   -their photo if they have one
#   -the list of allies or 'none'
#   -the list of enemies or 'none'
#   -any affiliation that the member has
# end