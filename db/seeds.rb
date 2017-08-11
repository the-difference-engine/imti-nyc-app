# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
true_false = [true, false]
users = User.where(role: nil)
courses = Course.all
# 3.times do 
#   Course.create(name: Faker::Company.name, start_date: Time.now, end_date: Time.now, price: 39.99, description: "Here is the description", lecturer: "Yoself")
# end
users.each do |user|
  user.update(course_id: courses.sample.id)
end