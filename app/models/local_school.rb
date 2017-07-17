class LocalSchool < ApplicationRecord
  has_many :users
  has_many :registrants
  validates :code, uniqueness: true, allow_nil: true 
  after_create :generate_code 

  private

  def generate_code
    return if update(code: rand(100_000..999_999))
    generate_code
  end
end
