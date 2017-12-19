class Event < ApplicationRecord
  validates :title, :start_time, presence: true

  scope :upcoming_events, -> { where('start_time > ?', Time.current).limit(3) }
  
  def pretty_time(time)
    if time
    	time.strftime("%I:%M %p")
    end
  end
end
