# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Application.destroy_all
Course.destroy_all
Education.destroy_all
LocalSchool.destroy_all
MontessoriTraining.destroy_all
Reference.destroy_all
Registrant.destroy_all
WorkExperience.destroy_all
RegistrantWorkshop.destroy_all
Workshop.destroy_all
Course.destroy_all


(1..100).each do |x|

  LocalSchool.create(id: x ,code: rand(100_000..999_999),name:Faker::Name.first_name ,contact_name:Faker::Name.first_name ,school_address:Faker::Address.street_address, bio:Faker::Hipster.sentence)

  User.create(id: x, course_id: rand(1..5),local_school_id: x, email:Faker::Internet.email, first_name:Faker::Name.first_name, last_name: Faker::Name.last_name, middle_initial:('A'..'Z').to_a.sample, donor:[true, false].sample ,role:rand(0..7), password:'password');

  Application.create(id: x, user_id: x , street:Faker::Address.street_address, city:Faker::Address.city, state:Faker::Address.state, country:Faker::Address.country, zip_code:Faker::Address.zip_code, phone_number:Faker::PhoneNumber.phone_number, payment_status:[true, false].sample, background_check:[true, false].sample, application_status: ['finished', 'pending', 'accepted'].sample, name_of_spouse:Faker::Name.name , birth_place:Faker::Address.state , birth_date: Time.now - (rand * 21), country_of_citizenship:Faker::Address.country, occupation:Faker::Company.profession, ages_of_children: rand(1..17))

  Education.create(id:x ,application_id:x ,school:Faker::University.name , location:Faker::Address.country, start_date:Time.now - (rand * 21) , end_date:Time.now - (rand * 21) ,degree:Faker::Name.title ,degree_date:Time.now - (rand * 21) )

  MontessoriTraining.create(id:x, application_id:x, name:Faker::Name.first_name, location:Faker::Address.state, diploma: Faker::Job.title, degree: Faker::Job.title, degree_date:Time.now - (rand * 21), experience:[true, false].sample)

  Reference.create(id:x, application_id: x, name:Faker::Name.first_name, address:Faker::Address.street_address, position: Faker::Job.title)

  Registrant.create(id:x, local_school_id: x, first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, affiliation:Faker::Company.name, occupation: Faker::Job.title, email:Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone )
  
  WorkExperience.create(id:x, application_id:x, employer:Faker::Company.name, occupation:Faker::Job.title, start_date: Time.now, end_date: Time.now + 1.day)

  RegistrantWorkshop.create(id:x, registrant_id:x, workshop_id:rand(1..5), payment_status: [true, false].sample)

end

(1..5).each do |x|

  Workshop.create(id:x, name:Faker::Educator.course, description:Faker::Lorem.sentence, price:Faker::Commerce.price, time:Time.now)

  Course.create(id: x, name:Faker::Company.name, start_date:Time.now, end_date:Time.now + 1.day ,price:rand(1..100) , description:Faker::Company.catch_phrase ,lecturer:Faker::Name.first_name)
end
