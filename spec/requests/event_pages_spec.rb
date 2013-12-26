require 'spec_helper'

describe "Event pages" do

  subject { page }

  describe "retreat page" do
    let(:event) { FactoryGirl.create(:event) }
    before { visit event_path(event) }

    it { should have_content(event.title) }
    it { should have_title(event.title) }
  end

  describe "Organize page" do

    before { visit organize_path }

    it { should have_content('Organize') }
    it { should have_title(full_title('Organize')) }

    let(:submit) { "Create my Retreat" }

    describe "with invalid information" do
      it "should not create a retreat" do
        expect { click_button submit }.not_to change(Event, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",        with: "Example Event"
        fill_in "Address 1",    with: "2000 main street"
        fill_in "E",            with: "6789376"
        fill_in "Organizer",    with: "orgboy"
      end

      it "should create a event" do
        expect { click_button submit }.to change(Event, :count).by(1)
      end
    end
  end
end