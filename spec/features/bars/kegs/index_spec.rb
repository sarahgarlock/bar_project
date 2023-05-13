require 'rails_helper'

RSpec.describe "/bars/:bar_id/kegs", type: :feature do
  describe "As a visitor, when I visit the bar kegs index page" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)

      @keg1 = @jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140)
      @keg2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar: @jacks_bar)
  end

    it "I see each Keg that is associated with the Bar" do
      visit "/bars/#{@jacks_bar.id}/kegs"

      expect(page).to have_content()
    end
  end
end