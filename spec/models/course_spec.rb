require 'rails_helper'

RSpec.describe Course, type: :model do
  it "has many users" do
    course = FactoryGirl.create(:course)
    john = User.create(
      first_name: "John",
      last_name: "Smith",
      email: "js@email.com",
      course_id: course.id
    )
    jeff = User.create(
      first_name: "Jeff",
      last_name: "Sessions",
      email: "jjj@email.com",
      course_id: course.id
    )
    expect(course.users[0].id).to eq(john.id)
  end
end
