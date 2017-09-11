class Event < ApplicationRecord
	def pretty_time(time)
		if time
			time.strftime("%I:%M %p")
		end
	end
end
