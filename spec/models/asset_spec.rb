require 'spec_helper'

describe Asset do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @asset = Asset.new
  end

  subject { @asset }

  it { should respond_to(:asset) }
  it { should respond_to(:product_id) }
  
end
