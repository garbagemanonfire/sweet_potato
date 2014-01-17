require 'spec_helper'

describe User do

  before do
    @user = User.new(email: "user@example.com", password: "password",
                     password_confirmation: "password")
  end

  subject { @user }

  it { should respond_to(:retreatregs) }
  it { should respond_to(:events) }
  it { should respond_to(:engaging?) }
  it { should respond_to(:engage!) }
  it { should respond_to(:disengage!) }

  describe "engaging" do

    let(:event) { FactoryGirl.create(:event) }

    before do
      @user.save
      @user.engage!(event)
    end

    it { should be_engaging(event) }
    its(:events) { should include(event) }

    describe "and disengaging" do
      before { @user.disengage!(event) }

      it { should_not be_engaging(event) }
      its(:events) { should_not include(event) }
    end
  end
end
