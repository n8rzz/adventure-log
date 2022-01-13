require 'rails_helper'

RSpec.feature "Create Journal Entries", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as user, scope: :user
  end

  context 'when user creates a valid entry' do
    before :each do
      visit new_journal_entry_path

      fill_in 'Entry date', with: Time.now()
      fill_in 'Body', with: 'This is the body text of a journal entry'
      click_button 'Create Journal entry'
    end

    it { expect(page).to have_text('Journal entry was successfully created.') }
  end

  context 'when user attempts to create an invalid entry' do
    before :each do
      visit new_journal_entry_path

      click_button 'Create Journal entry'
    end

    it { expect(page).to_not have_text('Journal entry was successfully created.') }
    it { expect(page).to_not have_text('User must exist') }
    it { expect(page).to have_text('2 errors prohibited this journal_entry from being saved:') }
    it { expect(page).to have_text('Body can\'t be blank') }
    it { expect(page).to have_text('Entry date can\'t be blank') }
  end
end
