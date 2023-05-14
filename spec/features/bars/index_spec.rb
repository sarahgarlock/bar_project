require 'rails_helper'

RSpec.describe "/bars", type: :feature do
  describe "as a visitor, when I visit the Bar Index page" do
    # User Story 1
    it "displays the name of each bar" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 1.day)
      crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today)
      visit "/bars"
      # save_and_open_page
      expect(page).to have_content(jacks_bar.name)
      expect(page).to have_content(crow_bar.name)
      expect(page).to have_content(jacks_bar.created_at)
      expect(page).to have_content(crow_bar.created_at)

      expect(jacks_bar.name).to appear_before(crow_bar.name)
    end

    it 'will display another link' do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
      keg1 = jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140)
      keg2 = jacks_bar.kegs.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: jacks_bar.id)
      
      visit "/bars"
      expect(page).to have_link("Keg Index Page", href: "/kegs")
      
      click_link "Keg Index Page"
      expect(current_path).to eq("/kegs")

    end

  end
end