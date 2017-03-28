class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :email, presence: true       
  has_one :application
  belongs_to :local_school, optional: true

  enum role: [:admin, :local_school_admin, :local_school_applicant, :domestic_applicant,
    :international_applicant, :current_teacher, :alumni, :member]

  def self.role_params
    {
      local_school_admin: '/schools/sign_up',
      domestic_applicant: '/sign_up',
      international_applicant: '/sign_up',
      current_teacher: '/sign_up',
      alumni: '/sign_up',
      member: '/sign_up'
    }.with_indifferent_access
  end

end
