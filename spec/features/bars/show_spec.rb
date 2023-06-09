require 'rails_helper'

RSpec.describe "/bars/:id", type: :feature do
  before(:each) do
    @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today)
    @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today)
    @keg_1 = Keg.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140, bar_id: @jacks_bar.id)
    @keg_2 = Keg.create!(name: "VooDoo Ranger Juicy Haze", beer_type: "Hazy IPA", ordered: true, abv: 7, ibu: 41, price: 155, bar_id: @jacks_bar.id)
    @keg_3 = Keg.create!(name: "Little Mo'Porter", beer_type: "Porter", ordered: false, abv: 6, ibu: 20, price: 165, bar_id: @crow_bar.id)
  end

  describe "As a visitor, when I visit /bars/:id" do
    it "will display the bar attributes" do
      # User Story 2
      visit "/bars/#{@jacks_bar.id}"
    
      expect(page).to have_content(@jacks_bar.name)
      expect(page).to have_content(@jacks_bar.city)
      expect(page).to have_content(@jacks_bar.tap_quantity)
      expect(page).to have_content(@jacks_bar.overnight_delivery)
    end

    it "should count the number of kegs each bar has" do
      # User Story 6
      visit "/bars/#{@jacks_bar.id}"
      expect(page).to have_content("#{@jacks_bar.keg_count}")

      visit "/bars/#{@crow_bar.id}"
      expect(page).to have_content("#{@crow_bar.keg_count}")
    end

    it "should have a link to the index of Kegs that belong to the Bar" do
      # User Story 10
      visit "/bars/#{@jacks_bar.id}"
      expect(page).to have_link("View this bars kegs")

      click_link "View this bars kegs"
      expect(current_path).to eq("/bars/#{@jacks_bar.id}/kegs")
    end

    it 'has a link to update the bar' do
      # User Story 12
      visit "/bars/#{@jacks_bar.id}"
      expect(page).to have_link("Update Bar")

      click_link "Update Bar"
      expect(current_path).to eq("/bars/#{@jacks_bar.id}/edit")
    end
  end
end