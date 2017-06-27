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

  describe 'test validations' do
    it 'should return error if start date is nil' do
      education = FactoryGirl.build(:education, start_date: nil)
      education.valid?
      expect(education.errors[:start_date]).to include("can't be blank")
    end

    it 'should return error if school is nil' do
      education = FactoryGirl.build(:education, school: nil)
      education.valid?
      expect(education.errors[:school]).to include("can't be blank")
    end

    it 'should return error if location is nil' do
      education = FactoryGirl.build(:education, location: nil)
      education.valid?
      expect(education.errors[:location]).to include("can't be blank")
    end

    it 'should return error if end date is nil' do
      education = FactoryGirl.build(:education, end_date: nil)
      education.valid?
      expect(education.errors[:end_date]).to include("can't be blank")
    end

    it 'should return error if degree is nil' do
      education = FactoryGirl.build(:education, degree: nil)
      education.valid?
      expect(education.errors[:degree]).to include("can't be blank")
    end

    it 'should return error if degree date is nil' do
      education = FactoryGirl.build(:education, degree_date: nil)
      education.valid?
      expect(education.errors[:degree_date]).to include("can't be blank")
    end
  end
end
