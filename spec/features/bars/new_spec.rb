require 'rails_helper'

RSpec.describe 'New bar' do
  describe 'As a visitor' do
    describe 'When I visit the new bar form by clicking a link on the index' do
      it 'I can create a new bar' do
        visit '/bars'

        click_link 'New Bar'

        expect(current_path).to eq('/bars/new')

        fill_in 'Name', with: 'Billys Inn'
        click_on 'Create Bar'

        expect(current_path).to eq("/bars")
        expect(page).to have_content('Billys Inn')
      end
    end
  end
end