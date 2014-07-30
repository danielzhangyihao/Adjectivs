require 'spec_helper'

describe Product do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.

    @product = Product.new(name: "The Lakshmi Dress", description: "The beautiful draping on this silk dress is inspired by the elegant folds of a sari.", price: 150,buy_url:"http://www.w3schools.com/xpath/xpath_syntax.asp" )


  end

  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:price)}
  it { should respond_to(:assets)}

  it { should respond_to(:buy_url)}

end