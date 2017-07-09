class OrderPickupSchedule < ApplicationRecord
	belongs_to :producer_entity
	has_one :address, as: :addressable

	def next_pickup_date
		d = Date.current
		next_pickup_date = d;
		if (d.wday < pickup_day_of_week) then
			next_pickup_date = d + (d.wday - pickup_day_of_week)
		elsif (d.wday > pickup_day_of_week) then
			next_pickup_date = d + (7 + pickup_day_of_week - d.wday)
		else
			# TODO same day
		end
		next_pickup_date
	end

	def formatted_pickup_time
		start_ampm = 'am'
		end_ampm = 'am'
		t = ''
		if (pickup_start_hour > 12) then
			t += (pickup_start_hour - 12).to_s
			start_ampm = 'pm'
		else
			t += pickup_start_hour.to_s
		end
		if (pickup_end_hour > 12) then
			end_ampm = 'pm'
		end
		if pickup_start_minute != 0 then
			t += ':' + pickup_start_minute.to_s
		end
		if start_ampm === 'am' and end_ampm === 'pm' then
			t += 'am'
		end
		t += '-'
		if pickup_end_hour > 12 then
			t += (pickup_end_hour - 12).to_s
		else
			t += pickup_end_hour.to_s
		end
		if pickup_end_minute != 0 then
			t += ':' + pickup_end_minute.to_s
		end
		t += end_ampm
		t
	end
end
