require 'spec_helper'

describe 'User pages' do

  subject { page }

  describe 'signup page' do
    before { visit new_user_registration_path }

    it { should have_content('Sign up') }
  end

  describe 'profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.email) }
    it { should have_title(user.email) }
  end

  describe 'engaging' do
    let(:user) { FactoryGirl.create(:user) }
    let(:event) { FactoryGirl.create(:event) }

    before do
      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
      user.engage!(event)
    end

    describe 'engaged users' do
      before do
        visit engaging_user_path(user.id)
      end

      it { should have_title(full_title('Engaging')) }
      it { should have_selector('h3', text: 'Engaging in these Retreats') }
      it { should have_link(event.title, href: event_path(event)) }
    end

  end
end
