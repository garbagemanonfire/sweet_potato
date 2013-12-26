require 'spec_helper'

describe "Event pages" do

  subject { page }

  describe "Organize page" do
    before { visit organize_path }

    it { should have_content('Organize') }
    it { should have_title(full_title('Organize')) }
  end
end