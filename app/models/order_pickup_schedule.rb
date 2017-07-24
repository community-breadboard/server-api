class OrderPickupSchedule < ApplicationRecord
	belongs_to :producer_entity
	has_many :orders
	has_one :address, as: :addressable

	def next_pickup_date
		d = Date.current
		_next_pickup_date = d;
		if (d.wday < pickup_day_of_week) then
			_next_pickup_date = d + (pickup_day_of_week - d.wday)
		elsif (d.wday > pickup_day_of_week) then
			_next_pickup_date = d + (7 + pickup_day_of_week - d.wday)
		else
			# Same day
			if (DateTime.current.seconds_since_midnight > ((pickup_end_hour * 60 * 60) + (pickup_end_minute * 60))) then
				_next_pickup_date = d + 7;
			end
		end
		_next_pickup_date
	end
	
	def is_in_sale_period
		_is_in_sale_period = false
		d = Date.current
		sale_start_seconds_since_midnight = ((sale_start_hour * 60 * 60) + (sale_start_minute * 60))
		sale_end_seconds_since_midnight = ((sale_end_hour * 60 * 60) + (sale_end_minute * 60))
		
		if (d.wday == sale_start_day_of_week && d.wday == sale_end_day_of_week) then
			if (DateTime.current.seconds_since_midnight >= sale_start_seconds_since_midnight && DateTime.current.seconds_since_midnight <= sale_end_seconds_since_midnight) then
				_is_in_sale_period = true;
			else
				_is_in_sale_period = false;
			end
		
		elsif (d.wday == sale_start_day_of_week) then
			if (DateTime.current.seconds_since_midnight >= sale_start_seconds_since_midnight) then
				_is_in_sale_period = true;
			else
				_is_in_sale_period = false;
			end

		elsif (d.wday == sale_end_day_of_week) then
			if (DateTime.current.seconds_since_midnight <= sale_end_seconds_since_midnight) then
				_is_in_sale_period = true;
			else
				_is_in_sale_period = false;
			end
		
		elsif (sale_start_day_of_week < sale_end_day_of_week) then
			if (d.wday > sale_start_day_of_week && d.wday < sale_end_day_of_week ) then
				_is_in_sale_period = true;
			else
				_is_in_sale_period = false;
			end
				
		elsif (sale_start_day_of_week > sale_end_day_of_week) then
			if (d.wday > sale_end_day_of_week && d.wday < sale_start_day_of_week ) then
				_is_in_sale_period = false;
			else
				_is_in_sale_period = true;
			end
		end

		_is_in_sale_period
	end
	
	
	def next_sale_start_datetime
		
		d = Date.current
		_next_sale_start_datetime = Time.current;
		if (d.wday < sale_start_day_of_week) then
			
			_next_sale_start_datetime = DateTime.now.next_day(sale_start_day_of_week - d.wday).change({ hour: sale_start_hour, min: sale_start_minute, sec: 0 })
			
		elsif (d.wday > sale_start_day_of_week) then

			_next_sale_start_datetime = DateTime.now.next_day(7 + sale_start_day_of_week - d.wday).change({ hour: sale_start_hour, min: sale_start_minute, sec: 0 })

		# Same day
		else

			if (DateTime.current.seconds_since_midnight >= ((sale_start_hour * 60 * 60) + (sale_start_minute * 60))) then
				_next_sale_start_datetime = DateTime.now.change({ hour: sale_start_hour, min: sale_start_minute, sec: 0 });
			else
				_next_sale_start_datetime = DateTime.now.next_day(7).change({ hour: sale_start_hour, min: sale_start_minute, sec: 0 });				
			end
			
		end

		_next_sale_start_datetime		
	end


	def next_sale_end_datetime
		
		d = Date.current
		_next_sale_end_datetime = Time.current;
		if (d.wday < sale_end_day_of_week) then
			
			_next_sale_end_datetime = DateTime.now.next_day(sale_end_day_of_week - d.wday).change({ hour: sale_end_hour, min: sale_end_minute, sec: 0 })
			
		elsif (d.wday > sale_end_day_of_week) then

			_next_sale_end_datetime = DateTime.now.next_day(7 + sale_end_day_of_week - d.wday).change({ hour: sale_end_hour, min: sale_end_minute, sec: 0 })

		# Same day
		else

			if (DateTime.current.seconds_since_midnight >= ((sale_end_hour * 60 * 60) + (sale_end_minute * 60))) then
				_next_sale_end_datetime = DateTime.now.next_day(7).change({ hour: sale_end_hour, min: sale_end_minute, sec: 0 });
			else
				_next_sale_end_datetime = DateTime.now.change({ hour: sale_end_hour, min: sale_end_minute, sec: 0 });				
			end
			
		end

		_next_sale_end_datetime		
	end


	#TODO move this to angular
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
	
	#TODO move this to angular
	def formatted_sale_start_time
		start_ampm = 'am'
		t = ''
		if (sale_start_hour > 12) then
			t += (sale_start_hour - 12).to_s
			start_ampm = 'pm'
		else
			t += sale_start_hour.to_s
		end
		if (pickup_end_hour > 12) then
			end_ampm = 'pm'
		end
		if sale_start_minute != 0 then
			t += ':' + sale_start_minute.to_s
		end
		t += start_ampm
		t
	end

end
