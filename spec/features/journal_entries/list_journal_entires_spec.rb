require 'rails_helper'

RSpec.feature "List Journal Entires", type: :feature do
  context 'when a user is not logged in' do
    before :each do
      visit root_path
    end

    it { expect(page).to_not have_link('Entries') }
    it { expect(page).to_not have_link('New Journal Entry') }
    it { expect(page).to have_link('Adventure Log') }
    it { expect(page).to have_link('Features') }
    it { expect(page).to have_link('About Us') }
  end
end
