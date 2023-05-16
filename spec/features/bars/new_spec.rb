require 'rails_helper'

RSpec.describe '/bars/new' do
  describe 'As a visitor, when I visit the new bar form by clicking a link on the index' do
    # User Story 11
    it 'I can create a new bar' do
      visit "/bars/new"

      fill_in(:name, with: "Billys Inn")
      fill_in(:city, with: "Wheat Ridge")
      fill_in(:tap_quantity, with: 3)
      fill_in(:overnight_delivery, with: false)
      click_on("Create Bar")
      
      expect(current_path).to eq("/bars")
      expect(page).to have_content("Billys Inn")
      expect(page).to have_content("Wheat Ridge")
      expect(page).to have_content(3)
      expect(page).to have_content(false)
    end
  end
end