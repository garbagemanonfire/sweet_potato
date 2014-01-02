require 'spec_helper'

describe "Event pages" do

  subject { page }

  describe "Retreat page" do
    let(:event) { FactoryGirl.create(:event) }
    before { visit event_path(event) }

    it { should have_content(event.title) }
    it { should have_title(event.title) }
  end

  describe "Organize page" do

    before { visit organize_path }

    it { should have_content('Organize') }
    it { should have_title(full_title('Organize')) }

    let(:submit) { "Create A Retreat" }

    describe "with invalid information" do
      it "should not create a retreat" do
        expect { click_button submit }.not_to change(Event, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",        with: "Example Event"
        fill_in "event_address_1",    with: "11 Park Ave."
        fill_in "E",            with: "67489376"
        fill_in "Organizer",    with: "23"
      end

      it "should create a event" do
        expect { click_button submit }.to change(Event, :count).by(1)
      end
    end
  end
end