require "rails_helper"

RSpec.describe "/kegs/:keg_id/edit" do
  describe "As a visitor, when I arribe at the edit keg page" do
    it "can edit an existing keg" do
      jacks_bar = Bar.create!(name: "Jacks Bar", city: "Arvada", tap_quantity: 8, overnight_delivery: false, created_at: Date.today - 2.day)
      keg_1 = Keg.create!(name: "Fat Tire", beer_type: "Amber", ordered: false, abv: 5, ibu: 22, price: 140, bar_id: jacks_bar.id)

      visit "/kegs/#{keg_1.id}/edit"

      fill_in(:name, with: "Bootstrap Rush" )
      fill_in(:beer_type, with: "IPA" )
      fill_in(:ordered, with: true )
      fill_in(:abv, with: 7 )
      fill_in(:ibu, with: 32)
      fill_in(:price, with: 152)

      click_button("Edit Keg")

      expect(current_path).to eq("/kegs/#{keg_1.id}")
      expect(page).to have_content("IPA")
      expect(page).to have_content(true)
      expect(page).to have_content(7)
      expect(page).to have_content(32)
      expect(page).to have_content(152)
    end
  end
end