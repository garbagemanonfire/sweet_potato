require 'spec_helper'

describe 'Event engagement' do
  subject { page }

  before do
    user = FactoryGirl.create(:user, password: 'meditate', email: "email@email.com")
    FactoryGirl.create(:event, title: "Soto Zen Retreat")
  end

  it 'unauthenticated user signs into engage event' do
    visit "/"

    click_on "Find a Retreat"
    click_on "Soto Zen Retreat"

    within("section") { click_on "Login" }

    fill_in 'user_email', with: 'email@email.com'
    fill_in 'user_password', with: 'meditate'

    click_on 'Sign in'

    subject.should have_text("Signed in successfully.")

    click_button "Engage"

    subject.should have_text("You have engaged with this retreat!")
  end
end