require "rails_helper"

RSpec.describe "/bars/:id/kegs/new" do
  describe "When I visit a Bar's Keg's Index page" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today - 1.day)
    end
    it "can see a form to add a new Keg" do
      # User Story 12
      visit "/bars/#{@jacks_bar.id}/kegs/new"
      fill_in(:name, with: "Coors Light")
      fill_in(:beer_type, with: "Lager")
      fill_in(:ordered, with: true)
      fill_in(:abv, with: 4)
      fill_in(:ibu, with: 3)
      fill_in(:price, with: 100)
    
      click_button("Create Keg")
      
      expect(current_path).to eq("/bars/#{@jacks_bar.id}/kegs")
      expect(page).to have_content("Coors Light")
      expect(page).to have_content("Lager")
      expect(page).to have_content(4)
      expect(page).to have_content(3)
      expect(page).to have_content(100)
    end
  end
end