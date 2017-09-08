class Event < ApplicationRecord
	def pretty_date_start
		start_time.strftime("%I:%M %p")
	end
	def pretty_date_end
		end_time.strftime("%I:%M %p")
	end
end
