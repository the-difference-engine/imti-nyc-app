require 'rails_helper'

describe MontessoriTraining do
  it "is valid with name, location, diploma, degree, degree_date, experience" do
    expect(build(:montessori_training)).to be_valid
  end
  it "is invalid without name" do
    montessori_training = build(:montessori_training, name: nil)
    montessori_training.valid?
    expect(montessori_training.errors[:name]).to include("can't be blank")
  end
  it "is invalid without location" do
    montessori_training = build(:montessori_training, location: nil)
    montessori_training.valid?
    expect(montessori_training.errors[:location]).to include("can't be blank")
  end
  it "is invalid without diploma" do
    montessori_training = build(:montessori_training, diploma: nil)
    montessori_training.valid?
    expect(montessori_training.errors[:diploma]).to include("can't be blank")
  end
  it "is invalid without degree" do
    montessori_training = build(:montessori_training, degree: nil)
    montessori_training.valid?
    expect(montessori_training.errors[:degree]).to include("can't be blank")
  end
  it "is invalid without degree_date" do
    montessori_training = build(:montessori_training, degree_date: nil)
    montessori_training.valid?
    expect(montessori_training.errors[:degree_date]).to include("can't be blank")
  end
  it "returns a pretty date" do
    montessori_training = create(:montessori_training, degree_date: "2016-06-19")
    expect(montessori_training.pretty_date).to eq("06/19/2016")
  end
end