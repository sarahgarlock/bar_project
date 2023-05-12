require 'rails_helper'

RSpec.describe "/bars", type: :feature do
  # User story 1
  describe "as a visitor, when I visit the Bar Index page" do
    let!(:jacks_bar) { Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false) }
    let!(:crow_bar) { Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false) }

    it "displays the name of each bar" do
      visit "/bars"
# save_and_open_page
      expect(page).to have_content(jacks_bar.name)
      expect(page).to have_content(crow_bar.name)
    end
  end
end