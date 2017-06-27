require 'rails_helper'

describe WorkExperience do
  it 'is valid with employer, occupation, start date, end date' do
    expect(build(:work_experience)).to be_valid
  end
  it 'is invalid without employer' do
    work_experience = build(:work_experience, employer: nil)
    work_experience.valid?
    expect(work_experience.errors[:employer]).to include("can't be blank")
  end
  it 'is invalid without occupation' do
    work_experience = build(:work_experience, occupation: nil)
    work_experience.valid?
    expect(work_experience.errors[:occupation]).to include("can't be blank")
  end
  it 'is invalid without start date' do
    work_experience = build(:work_experience, start_date: nil)
    work_experience.valid?
    expect(work_experience.errors[:start_date]).to include("can't be blank")
  end
  it 'is invalid without end date' do
    work_experience = build(:work_experience, end_date: nil)
    work_experience.valid?
    expect(work_experience.errors[:end_date]).to include("can't be blank")
  end
  it 'returns a pretty start date' do
    work_experience = build(:work_experience, start_date: '2007-06-22')
    expect(work_experience.pretty_start_date).to eq('06/22/2007')
  end
  it 'returns a pretty end date' do
    work_experience = build(:work_experience, end_date: '2009-06-22')
    expect(work_experience.pretty_end_date).to eq('06/22/2009')
  end
end
