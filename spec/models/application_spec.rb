require 'rails_helper'

RSpec.describe Application, type: :model do
  describe 'data validations' do
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:birth_place) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:country_of_citizenship) }
    it { should validate_presence_of(:occupation) }
  end

  describe 'belongs_to' do
    it { should belong_to(:user) }
  end

  describe 'has_many/has_one' do
    it { should have_many(:references) }
    it { should have_many(:educations) }
    it { should have_many(:montessori_trainings) }
    it { should have_many(:work_experiences) }
    it { should have_many(:transcripts) }
    it { should have_many(:recommendations) }
    it { should have_many(:resumes) }
    it { should have_many(:personal_essays) }
    it { should have_many(:health_forms) }
    it { should have_many(:toefl_ielts_score_reports) }
    it { should have_one(:passport_photo) }
    it { should have_one(:wes_evaluation) }
    it { should have_one(:student_visa) }
  end

  describe 'converts date to strftime' do
    application = FactoryGirl.build(:application)
    it 'should convert birth date to strftime' do
      expect(application.pretty_date(application.birth_date)).to eq '01/01/2001'
    end
  end
end
