require 'rails_helper'

RSpec.describe "/bars/:id" do
  describe "As a visitor, when I visit /bars/:id"
    it "will display the bar attributes" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false)
      visit "/bars/#{jacks_bar.id}"
      save_and_open_page

      expect(page).to have_content(jacks_bar.name)
      expect(page).to have_content(jacks_bar.city)
      expect(page).to have_content(jacks_bar.tap_quantity)
      expect(page).to have_content(jacks_bar.overnight_delivery)
    end
end