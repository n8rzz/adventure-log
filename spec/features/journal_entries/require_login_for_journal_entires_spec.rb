require 'rails_helper'

RSpec.feature "Require Login For Journal Entires", type: :feature do
  context 'when unknown user attempts to visit the journal entires path' do
    before :each do
      visit journal_entries_path
    end

    it { expect(page).to_not have_current_path(root_path) }
    it { expect(page).to have_text('You need to sign in or sign up before continuing.') }
    it { expect(page).to have_current_path(new_user_session_path) }
  end
end
