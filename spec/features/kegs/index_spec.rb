require 'rails_helper'

RSpec.describe "/kegs", type: :feature do
  describe "As a visitor, when i visit the kegs index page" do
    before(:each) do

      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)

      @keg1 = @jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140)
      @keg2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar: @jacks_bar)
    end
    it "I see the each keg in the system includding the keg's attributes" do
      visit "/kegs"

      expect(page).to have_content("Name: #{@keg1.name}")
      expect(page).to have_content("Type: #{@keg1.beer_type}")
      expect(page).to have_content("Ordered: #{@keg1.ordered?}")
      expect(page).to have_content("ABV: #{@keg1.abv}")
      expect(page).to have_content("IBU: #{@keg1.ibu}")
      expect(page).to have_content("Price: $#{@keg1.price}")

      expect(page).to have_content("Name: #{@keg2.name}")
      expect(page).to have_content("Type: #{@keg2.beer_type}")
      expect(page).to have_content("Ordered: #{@keg2.ordered?}")
      expect(page).to have_content("ABV: #{@keg2.abv}")
      expect(page).to have_content("IBU: #{@keg2.ibu}")
      expect(page).to have_content("Price: $#{@keg2.price}")
# save_and_open_page

    end
    it 'will display Bar\'s link' do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
      keg1 = jacks_bar.kegs.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140)
      keg2 = jacks_bar.kegs.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: jacks_bar.id)
      visit "/bars"
      expect(page).to have_link("Bar Index Page", href: "/bars")
      click_link "Bar Index Page"
      expect(current_path).to eq("/bars")
    end
  end
end