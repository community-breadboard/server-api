json.(@user, :id, :email, :first_name, :last_name, :type, :balance, :can_place_order)

if @user.most_recent_order
	json.most_recent_order do
		json.id @user.most_recent_order.id
		json.is_open @user.most_recent_order.is_open
		json.next_sale_start_datetime @user.most_recent_order.next_sale_start_datetime
		json.next_pickup_date @user.most_recent_order.next_pickup_date
		json.formatted_pickup_time @user.most_recent_order.formatted_pickup_time
		json.pickup_location_name @user.most_recent_order.pickup_location_name
		json.datetime_placed @user.most_recent_order.datetime_placed
		json.total_cost @user.most_recent_order.total_cost
		
		json.food_items @user.most_recent_order.order_sellable_food_items do |order_sellable_food_item|
			json.name order_sellable_food_item.sellable_food_item.food_item.name
			json.unit_cost order_sellable_food_item.sellable_food_item.unit_cost
			json.description order_sellable_food_item.sellable_food_item.food_item.description
			json.id order_sellable_food_item.sellable_food_item.food_item.id
			json.sellable_food_item_id order_sellable_food_item.sellable_food_item.id
			json.quantity_ordered order_sellable_food_item.quantity
			json.unit_label_singular order_sellable_food_item.sellable_food_item.food_item.unit_label_singular
			json.unit_label_plural order_sellable_food_item.sellable_food_item.food_item.unit_label_plural
			json.description order_sellable_food_item.sellable_food_item.food_item.description
			json.ingredients order_sellable_food_item.sellable_food_item.food_item.ingredients
		end
	end	
end
json.family do
	json.name @user.family.name

	json.producer_entity do
		json.name @user.family.producer_entity.name
		json.description @user.family.producer_entity.description
		json.web_site_url @user.family.producer_entity.web_site_url
		json.offerings @user.family.producer_entity.offerings
	end

	json.order_pickup_schedule do
		json.id @user.family.order_pickup_schedule.id
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
		json.formatted_sale_start_time @user.family.order_pickup_schedule.formatted_sale_start_time
		json.is_in_sale_period @user.family.order_pickup_schedule.is_in_sale_period
		json.next_sale_start_datetime @user.family.order_pickup_schedule.next_sale_start_datetime
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
