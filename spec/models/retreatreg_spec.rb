require 'spec_helper'

describe Retreatreg do

  let(:user) { FactoryGirl.create(:user) }
  let(:event) { FactoryGirl.create(:event) }
  before { @retreatreg = user.retreatregs.build(event_id: event.id) }

  subject { @retreatreg }

  it { should be_valid }

  describe 'retreat methods' do
    subject { @retreatreg }
    it { should respond_to(:user) }
    it { should respond_to(:event) }
    its(:user) { should eq user }
    its(:event) { should eq event }
  end

  describe 'when user id is not present' do
    before { @retreatreg.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when event id is not present' do
    before { @retreatreg.event_id = nil }
    it { should_not be_valid }
  end
end
