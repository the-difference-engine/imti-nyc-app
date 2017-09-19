class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :finished, -> { where(application_status: 'finished') }
  
end
