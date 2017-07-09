json.(@user, :email, :first_name, :last_name, :type, :balance)

json.family do
	json.name @user.family.name

	json.producer_entity do
		json.name @user.family.producer_entity.name
		json.description @user.family.producer_entity.description
		json.web_site_url @user.family.producer_entity.web_site_url
		json.offerings @user.family.producer_entity.offerings
	end

	json.order_pickup_schedule do
		json.sale_start_day_of_week @user.family.order_pickup_schedule.sale_start_day_of_week
		json.sale_start_hour @user.family.order_pickup_schedule.sale_start_hour
		json.sale_start_minute @user.family.order_pickup_schedule.sale_start_minute
		json.sale_end_day_of_week @user.family.order_pickup_schedule.sale_end_day_of_week
		json.sale_end_hour @user.family.order_pickup_schedule.sale_end_hour
		json.sale_end_minute @user.family.order_pickup_schedule.sale_end_minute
		json.pickup_day_of_week @user.family.order_pickup_schedule.pickup_day_of_week
		json.pickup_start_hour @user.family.order_pickup_schedule.pickup_start_hour
		json.pickup_start_minute @user.family.order_pickup_schedule.pickup_start_minute
		json.pickup_end_hour @user.family.order_pickup_schedule.pickup_end_hour
		json.pickup_end_minute @user.family.order_pickup_schedule.pickup_end_minute
		json.next_pickup_date @user.family.order_pickup_schedule.next_pickup_date
		json.formatted_pickup_time @user.family.order_pickup_schedule.formatted_pickup_time
		json.address do
			json.name @user.family.order_pickup_schedule.address.name
			json.street @user.family.order_pickup_schedule.address.street
			json.street2 @user.family.order_pickup_schedule.address.street2
			json.city @user.family.order_pickup_schedule.address.city
			json.state @user.family.order_pickup_schedule.address.state
			json.zip_code @user.family.order_pickup_schedule.address.zip_code
		end
	end
end
