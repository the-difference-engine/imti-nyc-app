class Event < ApplicationRecord
<<<<<<< 1dbbe9c6d227b832b4e83bcb217be9d04ebfd45b
  validates :title, :start_time, presence: true

	def pretty_time(time)
		if time
			time.strftime("%I:%M %p")
	end
	end
=======
>>>>>>> added code in factory girl to populate events in calendar
end
