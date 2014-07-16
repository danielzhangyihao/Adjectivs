require 'spec_helper'

describe Product do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @product = Product.new(name: "The Lakshmi Dress", description: "The beautiful draping on this silk dress is inspired by the elegant folds of a sari.", price: 150)
  end

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price)}
end