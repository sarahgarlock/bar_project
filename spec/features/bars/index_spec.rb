require 'rails_helper'

RSpec.describe "/bars", type: :feature do
  describe "as a visitor, when I visit the Bar Index page" do
    before(:each) do
      @jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      @crow_bar =  Bar.create!(name: "Crow Bar", city: "Wheat Ridge", tap_quantity: 10, overnight_delivery: false, created_at: Date.today - 1.day)
      @local_46 =  Bar.create!(name: "Local 46", city: "Wheat Ridge", tap_quantity: 15, overnight_delivery: true, created_at: Date.today)
      visit "/bars"
    end
    it "displays the name of each bar" do
      # User Story 1
      expect(page).to have_content(@jacks_bar.name)
      expect(page).to have_content(@crow_bar.name)
      expect(page).to have_content(@local_46.name)
    end
    
    it "will show in order by when it was created" do
      # User Story 6
      expect(page).to have_content(@jacks_bar.created_at)
      expect(page).to have_content(@crow_bar.created_at)
      expect(page).to have_content(@local_46.created_at)

      expect(@jacks_bar.name).to appear_before(@crow_bar.name)
      expect(@crow_bar.name).to appear_before(@local_46.name)
    end
  end
end