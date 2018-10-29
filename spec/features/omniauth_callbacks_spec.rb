require 'rails_helper'

RSpec.feature 'Omniauth Users' do
  describe 'Logging in User', type: :feature do
    before :each do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    end

    it 'logs in user when providing credentials to github' do
      visit root_path
      click_link 'Sign in with Github'
      expect(page).to have_content('Sign Out')
    end

    it 'can\'t see logout button if it is not logged in' do
      visit root_path
      expect(page).to_not have_content('Sign Out')
    end
  end

  describe 'Logged in User', type: :feature do
    before :each do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
    end
    
    it 'displays correct information on root page' do
      visit root_path
      click_link 'Sign in with Github'
      expect(page).to have_content(Rails.application.env_config["omniauth.auth"].info.name)
    end
  end
end