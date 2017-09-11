class Event < ApplicationRecord
	def pretty_date(date)
		if date
			date.strftime("%I:%M %p")
		end
	end
end
