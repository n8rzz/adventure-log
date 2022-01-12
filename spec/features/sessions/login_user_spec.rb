require 'rails_helper'

RSpec.feature "Login User", type: :feature do
  context 'when user clicks `Login` from header' do
    before :each do
      visit root_path

      within '.qa-header' do
        click_link 'Login'
      end
    end

    it { expect(page).to have_link('Sign up') }
    it { expect(page).to have_link('Forgot your password?') }
    it { expect(page).to have_button('Sign in with GoogleOauth2') }
  end

  context 'when an existing user attempts login' do
    let!(:user) { create(:user) }

    before :each do
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within '.qa-login-form' do
        click_button 'Login'
      end
    end

    it { expect(page).to have_text('Signed in successfully.') }
    it { expect(page).to have_link('Logout') }
  end

  context 'when user clicks `Sign up` from login form' do
    before :each do
      visit new_user_session_path

      within '.qa-login-form' do
        click_link 'Sign up'
      end
    end

    it { expect(page).to have_current_path(new_user_registration_path) }
  end
end
