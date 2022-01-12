require 'rails_helper'

RSpec.feature "Register User", type: :feature do
  context 'when user clicks `Sign Up` from header' do
    before :each do
      visit root_path
      click_link 'Sign Up'
    end

    it { expect(page).to have_link('Login') }
    it { expect(page).to have_button('Sign in with GoogleOauth2') }
  end

  context 'when user completes registraion form' do
    before :each do
      visit new_user_registration_path

      fill_in 'Email', with: 'steve_zissou@example.com'
      fill_in 'Password', with: '123456789abcde'
      fill_in 'Password confirmation', with: '123456789abcde'
      click_button 'Sign up'
    end

    it { expect(page).to have_text('Welcome! You have signed up successfully.') }
  end

  context 'when user clicks `Login` from Sign up form' do
    before :each do
      visit new_user_registration_path

      within '.qa-sign-up-form' do
        click_link 'Log in'
      end
    end

    it { expect(page).to have_current_path(new_user_session_path) }
  end
end
