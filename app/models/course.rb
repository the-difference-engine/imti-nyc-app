class Course < ApplicationRecord
	has_many :course_registrations
	has_many :users, through: :course_registrations
end
