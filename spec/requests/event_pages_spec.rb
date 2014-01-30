require 'spec_helper'

describe 'Event pages' do

  subject { page }

  describe 'Retreat page' do
    let(:user) { FactoryGirl.create(:user) }
    let(:event) { FactoryGirl.create(:event) }

    before do
      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
      visit event_path(event)
    end

    it { should have_content(event.title) }
    it { should have_title(event.title) }
    it { should have_content(user.email) }

  end

  describe 'Organize page' do

    let(:user) { FactoryGirl.create(:user) }

    before do
      visit '/users/sign_in'
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Sign in'
      visit organize_path
    end

    it { should have_content('Organize') }
    it { should have_title(full_title('Organize')) }

    let(:submit) { 'Create A Retreat' }

    describe 'with invalid information' do
      it 'should not create a retreat' do
        expect { click_button 'Create A Retreat' }.not_to change(Event, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'Title', with: 'Example 1'
        fill_in 'event_address_1', with: '10 Park Place'
      end

      it 'should create an event' do
        expect { click_button submit }.to change(Event, :count).by(1)
      end
    end

    describe 'with valid organizer id information' do
      before do
        fill_in 'Title', with: 'Example 3'
        fill_in 'event_address_1',    with: '14 Park Place'
        click_button submit
      end

      it 'should create an event with a proper organizer id' do
        (Event.last.organizer_id).eql?(user.id)
      end
    end

    describe 'edit event' do

      let(:event) { FactoryGirl.create(:event) }

      before do
        visit edit_event_path(event)
      end

      describe 'page' do
        it { should have_content('Update Your Retreat') }
        it { should have_title('Edit Retreat') }
      end

      describe 'should update an event' do
        let(:new_title)  { 'Example 2' }
        let(:new_event_address_1) { '11 Park Place' }

        before do
          fill_in 'Title',              with: new_title
          fill_in 'event_address_1',    with: new_event_address_1
          click_button 'Save changes'
        end

        it { should have_title(new_title) }
        it { should have_selector('div.alert.alert-success') }
        specify { expect(event.reload.title).to  eq new_title }
        specify { expect(event.reload.address_1).to eq new_event_address_1 }
      end
    end

    describe 'engage/disengage buttons' do
      let(:event) { FactoryGirl.create(:event) }
      # before { sign_in user }

      describe 'engaging a retreat' do
        before { visit event_path(event) }

        it 'should increment the engaged users count' do
          expect do
            click_button 'Engage'
          end.to change(event.users, :count).by(1)
        end

        it 'should increment the users events count' do
          expect do
            click_button 'Engage'
          end.to change(user.events, :count).by(1)
        end

        describe 'toggling the button' do
          before { click_button 'Engage' }
          it { should have_xpath("//input[@value='Disengage']") }
        end
      end

      describe 'disengageing an event' do
        before do
          user.engage!(event)
          visit event_path(event)
        end

        it 'should decrement the engaged users count' do
          expect do
            click_button 'Disengage'
          end.to change(event.users, :count).by(-1)
        end

        it 'should increment the users events count' do
          expect do
            click_button 'Disengage'
          end.to change(user.events, :count).by(-1)
        end

        describe 'toggling the button' do
          before { click_button 'Disengage' }
          it { should have_xpath("//input[@value='Engage']") }
        end
      end
    end
  end

  describe 'with edit button for organizer' do
    let(:user) { FactoryGirl.create(:user) }
    let(:visitor) { FactoryGirl.create(:user, id: 100, email: 'visitor@email.com') }
    let(:event) { FactoryGirl.create(:event, organizer: user, title: "Soto Zen Retreat") }

    describe 'organizer should see edit button' do
      before do
        event
        visit '/'
        click_on "Login"
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_on 'Sign in'
        click_link "Soto Zen Retreat"
      end

      it { should have_link('Edit') }
    end

    describe 'non-organizer vistor should not see edit button' do
      before do
        visitor
        visit event_path(event)
      end

      it { should_not have_link('Edit') }
    end
  end
end
