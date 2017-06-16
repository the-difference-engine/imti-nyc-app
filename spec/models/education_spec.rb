require 'rails_helper'

RSpec.describe Education, type: :model do
  
  it "has a valid factory" do
    expect(FactoryGirl.build(:education)).to be_valid
  end

  describe "converts date to strftime" do
    education = FactoryGirl.build(:education)
    it 'should convert education start date to strftime' do
      expect(education.pretty_date(education.start_date)).to eq '01/01/2001'
    end
  end


end
