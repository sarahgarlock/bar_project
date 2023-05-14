require 'rails_helper'

RSpec.describe "/kegs/:id" do
  describe "As a visitor, when I visit /kegs/:id" do
    it "will display the kegs attributes" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
      keg2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: jacks_bar.id)
      visit "/kegs/#{jacks_bar.id}"

      expect(page).to have_content(keg2.name)
    end
  end
end