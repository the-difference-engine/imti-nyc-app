class Registrant < ApplicationRecord
  has_many :registrant_workshops
  has_many :workshops, through: :registrant_workshops
end