require 'rails_helper'

RSpec.describe Document, type: :model do
  it "has valid factory" do
    expect(FactoryGirl.create(:document)).to be_valid
  end
end
