# create_table "users", force: :cascade do |t|
#     t.string   "email",                  default: "", null: false
#     t.string   "encrypted_password",     default: "", null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",          default: 0,  null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet     "current_sign_in_ip"
#     t.inet     "last_sign_in_ip"
#     t.string   "confirmation_token"
#     t.datetime "confirmed_at"
#     t.datetime "confirmation_sent_at"
#     t.string   "unconfirmed_email"
#     t.string   "first_name",                          null: false
#     t.string   "last_name",                           null: false
#     t.datetime "created_at",                          null: false
#     t.datetime "updated_at",                          null: false
#     t.string   "middle_initial"
#     t.boolean  "donor"
#     t.integer  "role"
#     t.integer  "local_school_id"
#     t.integer  "course_id"
#     t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
#   end
FactoryGirl.define do
  password = Faker::Internet.password(8)
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { password }
    password_confirmation { password }
  end
end