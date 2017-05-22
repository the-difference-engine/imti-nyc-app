class RegistrantWorkshop < ApplicationRecord
  belongs_to :registrant
  belongs_to :workshop 
end
