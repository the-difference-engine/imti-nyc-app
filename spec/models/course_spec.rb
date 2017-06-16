require 'rails_helper'

RSpec.describe Course, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has valid factory" do
    expect(FactoryGirl.create(:course)).to be_valid
  end

  it "price is a decimal" do
    course = FactoryGirl.create(:course)
    expect(course.price.class).to eq(BigDecimal)
  end

  it "has many users" do
    course = FactoryGirl.build(:course)
    john = FactoryGirl.build(:user)
    tom = FactoryGirl.build(:user, first_name: "tom")

    course.users << john << tom 

    # p "course #{course.id}"
    # john = User.create!(
    #   first_name: "John",
    #   last_name: "Smith",
    #   email: "js@email.com",
    #   course_id: course.id,
    #   password: "password",
    #   password_confirmation: "password"
    # )
    # jeff = User.create!(
    #   first_name: "Jeff",
    #   last_name: "Sessions",
    #   email: "jjj@email.com",
    #   course_id: course.id,
    #   password: "password",
    #   password_confirmation: "password"
    # )
    # p "course.users #{course.users}"
    # p "course.users #{course.users[0]}"
    expect(course.users[0].id).to eq(john.id)
  end
end
