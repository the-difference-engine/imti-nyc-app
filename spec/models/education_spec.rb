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

    it "Education model should have a valid factory with faker" do
      edu = FactoryGirl.build(:education)
      expect(edu).to be_valid
    end

    it "Application model should have a valid factory with faker" do
      app = FactoryGirl.build(:application)
      expect(app).to be_valid
    end

    it "should give a pretty_date to start_date" do
      edu = FactoryGirl.build(:education)
      expect(edu.pretty_date(edu.start_date)).to eq '06/08/2017'
    end

    it "should give a pretty_date to end_date" do
      edu = FactoryGirl.build(:education)
      expect(edu.pretty_date(edu.end_date)).to eq '06/10/2017'
    end

    it "should give a pretty_date to degree_date" do
      edu = FactoryGirl.build(:education)
      p edu.pretty_date(edu.start_date)
      expect(edu.pretty_date(edu.degree_date)).to eq '06/11/2017'
    end

    it "should have a pretty_date automatically without calling pretty_date" do
      edu = FactoryGirl.build(:education)
      p edu.start_date
      expect(edu.start_date).to eq 'Thu, 08 Jun 2017 19:36:36 UTC +00:00'
    end

    it "should have a different date if pretty_date is called on the date" do
      edu = FactoryGirl.build(:education)
      p edu.pretty_date(edu.start_date)
      p edu.start_date
      expect(edu.start_date.to_s).not_to eq "06/08/2017"
    end
  end
end
