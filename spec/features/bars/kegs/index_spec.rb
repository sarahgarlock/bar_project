require 'rails_helper'

RSpec.describe "/bars/:bar_id/kegs", type: :feature do
  describe "As a visitor, when I visit the bar kegs index page" do
    it "I see each Keg that is associated with that Bar with each Keg's attributes" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
  
      keg1 = jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140, bar: @jacks_bar)
      keg2 = jacks_bar.kegs.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar: @jacks_bar)
      visit "/bars/#{jacks_bar.id}/kegs"

      expect(page).to have_content(jacks_bar.name)
      expect(page).to have_content(keg1.name)
      expect(page).to have_content(keg1.beer_type)
      expect(page).to have_content(keg1.ordered)
      expect(page).to have_content(keg1.abv)
      expect(page).to have_content(keg1.ibu)
      expect(page).to have_content(keg1.price)

      expect(page).to have_content(keg2.name)
      expect(page).to have_content(keg2.beer_type)
      expect(page).to have_content(keg2.ordered)
      expect(page).to have_content(keg2.abv)
      expect(page).to have_content(keg2.ibu)
      expect(page).to have_content(keg2.price)
      # save_and_open_page
    end
  end
end