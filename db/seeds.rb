# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

10.times do 
  course = Course.create!(name:Faker::Company.name, start_date:Time.now, end_date:Time.now + 1.day ,price:rand(1..100) , description:Faker::Company.catch_phrase ,lecturer:Faker::Name.first_name)

  workshop = Workshop.create(name:Faker::Educator.course, description:Faker::Lorem.sentence, price:Faker::Commerce.price, time:Time.now + rand(1..100).day)
  
  local_school = LocalSchool.create(code: rand(100_000..999_999),name:Faker::Name.first_name ,contact_name:Faker::Name.first_name ,school_address:Faker::Address.street_address, bio:Faker::Hipster.sentence)
end

50.times do 
  user = User.create(course_id:Course.all.ids.sample,local_school_id: LocalSchool.all.ids.sample, email:Faker::Internet.email, first_name:Faker::Name.first_name, last_name: Faker::Name.last_name, middle_initial:('A'..'Z').to_a.sample, donor:[true, false].sample ,role:rand(0..7), password:'password')

  application = Application.create(user_id:user.id , street:Faker::Address.street_address, city:Faker::Address.city, state:Faker::Address.state, country:Faker::Address.country, zip_code:Faker::Address.zip_code, phone_number:Faker::PhoneNumber.phone_number, payment_status:[true, false].sample, background_check:[true, false].sample, application_status: ['finished', 'pending', 'accepted'].sample, name_of_spouse:Faker::Name.name , birth_place:Faker::Address.state , birth_date: Time.now - (rand * 21), country_of_citizenship:Faker::Address.country, occupation:Faker::Company.profession, ages_of_children: rand(1..17))
  
  registrant = Registrant.create(local_school_id: LocalSchool.all.ids.sample, first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, affiliation:Faker::Company.name, occupation: Faker::Job.title, email:Faker::Internet.email, phone: Faker::PhoneNumber.cell_phone)

  RegistrantWorkshop.create(registrant_id:registrant.id, workshop_id: Workshop.all.ids.sample, payment_status: [true, false].sample)

  Education.create(application_id:application.id ,school:Faker::University.name , location:Faker::Address.country, start_date:Time.now - (rand * 21) , end_date:Time.now - (rand * 21) ,degree:Faker::Name.title ,degree_date:Time.now - (rand * 21))

  MontessoriTraining.create(application_id:application.id, name:Faker::Name.first_name, location:Faker::Address.state, diploma: Faker::Job.title, degree: Faker::Job.title, degree_date:Time.now - (rand * 21), experience:[true, false].sample)

  Reference.create(application_id:application.id, name:Faker::Name.first_name, address:Faker::Address.street_address, position: Faker::Job.title)

  WorkExperience.create(application_id:application.id, employer:Faker::Company.name, occupation:Faker::Job.title, start_date: Time.now, end_date: Time.now + 1.day)
end






