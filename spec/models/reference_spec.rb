require 'rails_helper'

RSpec.describe Reference, type: :model do
  describe Reference do
    it "is valid with name address position" do
      expect(build(:reference)).to be_valid
    end
  end
end
