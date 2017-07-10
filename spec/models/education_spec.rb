require 'rails_helper'

RSpec.describe Education, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:education)).to be_valid
  end

  describe 'converts date to strftime' do
    education = FactoryGirl.build(:education)
    it 'converts education start date to strftime' do
      expect(education.pretty_date(education.start_date)).to eq '01/01/2001'
    end

    it 'converts education end date to strftime' do
      expect(education.pretty_date(education.end_date)).to eq '05/30/2008'
    end
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
  end
end
