json.array! @service_days do |d|
	json.service_date d.service_date
	json.description d.description
	json.signup_genius_link d.signup_genius_link
end
