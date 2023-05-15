require 'rails_helper'

RSpec.describe "/kegs", type: :feature do
  describe "As a visitor, when I visit the kegs index page" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today - 1.day)
      @local_46 =  Bar.create!(name: "Local 46", city: "Wheat Ridge", tap_quantity: 15, overnight_delivery: true, created_at: Date.today)

      @keg_1 = Keg.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140, bar_id: @jacks_bar.id)
      @keg_2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: @jacks_bar.id)
      @keg_3 = Keg.create!(name: "Little Mo'Porter", beer_type: "Porter", ordered: false, abv: 6, ibu: 20, price: 165, bar_id: @crow_bar.id)
  
      visit "/kegs"
    end

    it "will display each keg in the system including the keg's attributes" do
      # User Story 3 & 5
      expect(page).to have_content("Name: #{@keg_1.name}")
      expect(page).to have_content("Type: #{@keg_1.beer_type}")
      expect(page).to have_content("Ordered: #{@keg_1.ordered?}")
      expect(page).to have_content("ABV: #{@keg_1.abv}")
      expect(page).to have_content("IBU: #{@keg_1.ibu}")
      expect(page).to have_content("Price: $#{@keg_1.price}")

      expect(page).to have_content("Name: #{@keg_2.name}")
      expect(page).to have_content("Type: #{@keg_2.beer_type}")
      expect(page).to have_content("Ordered: #{@keg_2.ordered?}")
      expect(page).to have_content("ABV: #{@keg_2.abv}")
      expect(page).to have_content("IBU: #{@keg_2.ibu}")
      expect(page).to have_content("Price: $#{@keg_2.price}")

    end

    it "will display the Keg's link at the top" do
      # User Story 8
      expect(page).to have_link("Keg Index Page")

      click_link "Keg Index Page"
      expect(current_path).to eq("/kegs")
    end

    it 'will display Bar\'s link at the top' do
      # User Story 9
      expect(page).to have_link("Bar Index Page")

      click_link "Bar Index Page"
      expect(current_path).to eq("/bars")
    end
  end
end