class Workshop < ApplicationRecord
  has_many :registrant_workshops
  has_many :registrants, through: :registrant_workshops
end
