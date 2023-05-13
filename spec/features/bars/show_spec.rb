require 'rails_helper'

RSpec.describe "/bars/:id", type: :feature do
  describe "as a visitor, when I visit a Bar show page" do
    # let(:jacks_bar) { Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false) }
    # let(:@crow_bar) { Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false) }
    # User Story 2
    it "will show the bar with that id including the bar's attributes" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "AAArvada", tap_quantity: 8, overnight_delivery: false)
      visit "/bars/:id"

      expect(page).to have_content("Name: #{jacks_bar.name}")
      expect(page).to have_content("City: #{jacks_bar.city}")
      expect(page).to have_content("Tap Quantity: #{jacks_bar.tap_quantity}")
      expect(page).to have_content("Overnight Delivery: #{jacks_bar.overnight_delivery}")
    end
  end
end