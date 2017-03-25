class Reference < ApplicationRecord
  # validates :name, :address, :position, presence: true
  belongs_to :application
end
