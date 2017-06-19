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
  it "should be a valid factory" do
    m = FactoryGirl.build(:education)
    puts m
    expect(m).to be_valid
  end
end
