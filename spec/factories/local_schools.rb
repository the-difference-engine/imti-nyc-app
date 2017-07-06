  # create_table "local_schools", force: :cascade do |t|
  #   t.integer  "code"
  #   t.string   "name"
  #   t.datetime "created_at",     null: false
  #   t.datetime "updated_at",     null: false
  #   t.string   "contact_name"
  #   t.string   "school_address"
  #   t.text     "bio"
  # end

FactoryGirl.define do
  factory :local_school do
    name Faker::Name.name
    contact_name Faker::Name.name
    school_address Faker::Address.street_address
    bio Faker::Lorem.sentence 
  end
end

