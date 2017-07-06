class LocalSchool < ApplicationRecord
  has_many :users
  has_many :registrants
  after_create :generate_code
  # after local_school is created - this line will call the generate_code method (below)
  # this could have been a before_save method to save database calls
  validates :code, uniqueness: true, allow_nil: true
  validates :name, presence: true
  validates :contact_name, presence: true
  validates :school_address, presence: true

  private

  def generate_code
    return if update(code: rand(100_000..999_999))
    # update returns a true or false if this is valid
    generate_code
  end
end
