require "rails_helper"

RSpec.describe "/bars/:bar_id/edit" do
  describe "as a visitor, when I visit the Bar index page" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today - 1.day)
    end

    it "can update an exisiting bar" do
      # User Story 12
      visit "/bars/#{@jacks_bar.id}/edit"

      fill_in(:name, with: "Speakeasy")
      fill_in(:city, with: "Golden")
      fill_in(:tap_quantity, with: 24)
      fill_in(:overnight_delivery, with: false)
      click_button "Update This Bar"

      expect(current_path).to eq("/bars/#{@jacks_bar.id}")
      expect(page).to have_content("Speakeasy")
      expect(page).to have_content("Golden")
      expect(page).to have_content("24")
      expect(page).to have_content("false")
    end
  end
end