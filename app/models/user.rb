require 'roo'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates :street, :city, :country, presence: true, on: :update, unless: :local_school_admin?
  validates :zip_code, :state, presence: true, on: :update, if: :domestic_applicant?
  has_one :application
  belongs_to :local_school, optional: true
  belongs_to :course, optional: true
  has_many :charges
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

  def full_name
    "#{first_name} #{last_name}"
  end

  def local_school_user?
    local_school_admin? || local_school_teacher?
  end

  def self.send_pending_app_email
    pending_apps = User.joins(:application).where.not(applications: {application_status: 'finished'})
    inactive_pending_apps = pending_apps.where('last_sign_in_at <= ?', 7.days.ago)
    inactive_pending_apps.each do |user|
      mg_client = Mailgun::Client.new(ENV['MAILGUN_API_KEY'])

      message_params = {from: 'imtinyc@gmail.com',
                        # to:   "#{email}",
                        to:   "imtinyc@gmail.com",
                        subject: "It's 2pm!!!!!!!",
                        text:    "nuuuuuuuuuu msg"}

      result = mg_client.send_message('sandbox4f9920610a894b81b82f6bc37e90f1a0.mailgun.org', message_params).to_h!
    end
  end
end
