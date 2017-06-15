require 'rails_helper'

RSpec.describe Course, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has valid factory" do
    expect(FactoryGirl.create(:course)).to be_valid
  end

  it "price is a decimal" do
    course = FactoryGirl.create(:course)
    expect(course.price.class).to eq(BigDecimal)
  end
end
