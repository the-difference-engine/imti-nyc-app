require 'rails_helper'

RSpec.describe Education, type: :model do
  # it "should be a valid Education" do
    # application = FactoryGirl.build(:application)
    # education = Education.new(
    #   application_id: application.id,
    #   school: "Montessori Awesome School",
    #   location: "The middle of Nowhere",
    #   start_date: "2017-06-15 19:36:36",
    #   end_date: "2017-06-10 19:36:36",
    #   degree: "Bachelors of Many Things",
    #   degree_date: "2017-06-11 19:36:36"
    # )
    # expect(education).to be_valid
  # end
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
