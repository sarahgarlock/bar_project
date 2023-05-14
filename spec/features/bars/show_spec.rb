require 'rails_helper'

RSpec.describe "/bars/:id" do
  describe "As a visitor, when I visit /bars/:id"
    it "will display the bar attributes" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
      keg1 = jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140)
      keg2 = jacks_bar.kegs.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: jacks_bar.id)

      visit "/bars/#{jacks_bar.id}"
      # save_and_open_page

      expect(page).to have_content(jacks_bar.name)
      expect(page).to have_content(jacks_bar.city)
      expect(page).to have_content(jacks_bar.tap_quantity)
      expect(page).to have_content(jacks_bar.overnight_delivery)
      expect(page).to have_content(jacks_bar.keg_count)
    end
end