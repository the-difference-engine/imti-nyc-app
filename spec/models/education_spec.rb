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

  it "should have a pretty_date automatically without calling pretty_date" do
    edu = FactoryGirl.build(:education)
    expect(edu.start_date).to eq 'Thu, 08 Jun 2017 19:36:36 UTC +00:00'
  end

  it "should have a different date if pretty_date is called on the date" do
    edu = FactoryGirl.build(:education)
    expect(edu.start_date.to_s).not_to eq "06/08/2017"
  end

end
