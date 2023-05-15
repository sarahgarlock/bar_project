require 'rails_helper'

RSpec.describe "/kegs/:id" do
  describe "As a visitor, when I visit /kegs/:id" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today - 1.day)
      @local_46 =  Bar.create!(name: "Local 46", city: "Wheat Ridge", tap_quantity: 15, overnight_delivery: true, created_at: Date.today)

      @keg_1 = Keg.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140, bar_id: @jacks_bar.id)
      @keg_2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: @jacks_bar.id)
      @keg_3 = Keg.create!(name: "Little Mo'Porter", beer_type: "Porter", ordered: false, abv: 6, ibu: 20, price: 165, bar_id: @crow_bar.id)
    end

    it "will display the kegs attributes with that id" do
      # User Story 4
      visit "/kegs/#{@keg_1.id}"

      expect(page).to have_content(@keg_1.name)
      expect(page).to have_content(@keg_1.beer_type)
      expect(page).to have_content(@keg_1.ordered)
      expect(page).to have_content(@keg_1.abv)
      expect(page).to have_content(@keg_1.ibu)
      expect(page).to have_content(@keg_1.price)

      visit "/kegs/#{@keg_2.id}"

      expect(page).to have_content(@keg_2.name)
      expect(page).to have_content(@keg_2.beer_type)
      expect(page).to have_content(@keg_2.ordered)
      expect(page).to have_content(@keg_2.abv)
      expect(page).to have_content(@keg_2.ibu)
      expect(page).to have_content(@keg_2.price)

      visit "/kegs/#{@keg_3.id}"

      expect(page).to have_content(@keg_3.name)
      expect(page).to have_content(@keg_3.beer_type)
      expect(page).to have_content(@keg_3.ordered)
      expect(page).to have_content(@keg_3.abv)
      expect(page).to have_content(@keg_3.ibu)
      expect(page).to have_content(@keg_3.price)
    end
  end
end