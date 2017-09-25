class Event < ApplicationRecord
  validates :title, :start_time, presence: true

  def pretty_time(time)
    if time
    	time.strftime("%I:%M %p")
    end
  end
end
  