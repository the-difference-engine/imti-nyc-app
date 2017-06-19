require 'rails_helper'

RSpec.describe Education, type: :model do
  it "Education model should have a valid factory with faker" do
    edu = FactoryGirl.build(:education)
    expect(edu).to be_valid
  end

  it "Application model should have a valid factory with faker" do
    app = FactoryGirl.build(:application)
    expect(app).to be_valid
  end

  describe 'data validations' do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:school) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:degree) }
    it { is_expected.to validate_presence_of(:degree_date) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:application) }
    it "should be a valid factory" do
      m = FactoryGirl.build(:education)
      puts m
      expect(m).to be_valid
    end
  end
end
