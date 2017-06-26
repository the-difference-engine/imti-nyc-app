require 'rails_helper'

RSpec.describe Application, type: :model do
  it 'should be valid' do  
    application = FactoryGirl.build(:application)
    expect(application).to be_valid
  end
end

RSpec.describe Application, type: :model do
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

RSpec.describe Application, type: :model do
  it { should belong_to(:user) }
end

RSpec.describe Application, type: :model do
  it { should have_many(:references) }
  it { should have_many(:educations) }
  it { should have_many(:montessori_trainings) }
  it { should have_many(:work_experiences) }

  it { should have_many(:documents) }
  
  it { should have_many(:documents).conditions(category: 'transcript') }

end
