require 'spec_helper'

describe 'Event engagement' do
  subject { page }

  before do
    user = FactoryGirl.create(:user, email: "micah@botandrose.com", password: "omgwtfbbq")
    FactoryGirl.create(:event, title: "BBQ", organizer_id: user.id)
  end

  it 'unauthenticated user signs into engage event' do
    visit "/"

    click_on "Find a Retreat"

    click_on "BBQ"

    within("article") { click_on "Login" }

    fill_in 'user_email', with: "micah@botandrose.com"
    fill_in 'user_password', with: "omgwtfbbq"
    click_on 'Sign in'

    within("article") { click_on "Engage" }

    subject.should have_text("You have engaged with this retreat!")
  end
end

