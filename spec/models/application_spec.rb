require 'rails_helper'

RSpec.describe Application, type: :model do

  it 'should be valid' do
    application = FactoryGirl.build(:application)
    expect(application).to be_valid
  end

  describe 'data validations' do
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zip_code) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:birth_place) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:country_of_citizenship) }
    it { is_expected.to validate_presence_of(:occupation) }
  end

  describe 'belongs_to' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'has_many/has_one' do
    it { is_expected.to have_many(:references) }
    it { is_expected.to have_many(:educations) }
    it { is_expected.to have_many(:montessori_trainings) }
    it { is_expected.to have_many(:work_experiences) }
    it { is_expected.to have_many(:transcripts) }
    it { is_expected.to have_many(:recommendations) }
    it { is_expected.to have_many(:resumes) }
    it { is_expected.to have_many(:personal_essays) }
    it { is_expected.to have_many(:health_forms) }
    it { is_expected.to have_many(:toefl_ielts_score_reports) }
    it { is_expected.to have_one(:passport_photo) }
    it { is_expected.to have_one(:wes_evaluation) }
    it { is_expected.to have_one(:student_visa) }
  end
end
