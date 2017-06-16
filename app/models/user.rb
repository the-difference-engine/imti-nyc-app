require 'roo'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, presence: true      
  has_one :application
  belongs_to :local_school, optional: true
  belongs_to :course, optional: true
  has_many :charges
<<<<<<< HEAD
=======
  belongs_to :courses
>>>>>>> Add user association test, delete course_registration model
  # if role are changed (order or names), must update any code dealing with roles

  ROLES = [:admin, :local_school_admin, :local_school_applicant, :domestic_applicant,
    :international_applicant, :current_teacher, :alumni, :member]
  enum role: ROLES

  def self.role_params
    {
      local_school_admin: ['/schools/sign_up'],
      domestic_applicant: ['/sign_up', '/'],
      international_applicant: ['/sign_up', '/'],
      current_teacher: ['/sign_up', '/'],
      alumni: ['/sign_up', '/'],
      member: ['/sign_up', '/']
    }.with_indifferent_access
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    spreadsheet.each do |row|
      User.create(first_name: row[0], last_name: row[1], email: ActionView::Base.full_sanitizer.sanitize(row[2]), password: row[3], password_confirmation: row[4])
    end
  end

  def local_school_user? 
    local_school_admin? || local_school_teacher?
  end
end
