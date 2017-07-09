json.array! @order_pickup_schedules do |s|

	json.(s, :sale_start_day_of_week, :sale_start_hour, :sale_start_minute, :sale_end_day_of_week, :sale_end_hour, :sale_end_minute, :pickup_day_of_week, :pickup_start_hour, :pickup_start_minute, :pickup_end_day_of_week, :pickup_end_hour, :pickup_end_minute)
	json.address do
		json.street s.address.street
		json.street2 s.address.street2
		json.city s.address.city
		json.state s.address.state
		json.zip_code s.address.zip_code
		json.longitude s.address.longitude
		json.latitude s.address.latitude
	end
	json.producer_entity do
		json.name s.producer_entity.name
	end
end
