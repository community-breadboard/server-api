json.(@user, :id, :email, :first_name, :last_name, :type)

json.producer_entity do
	json.id @user.producer_entity.id
	json.web_site_url @user.producer_entity.web_site_url
	json.name @user.producer_entity.name
	json.offerings @user.producer_entity.offerings

	json.order_pickup_schedules_for_delivery @user.producer_entity.order_pickup_schedules_for_delivery do |pickup|
		json.id pickup.id
		json.sale_start_day_of_week pickup.sale_start_day_of_week
		json.sale_start_hour pickup.sale_start_hour
		json.sale_start_minute pickup.sale_start_minute
		json.sale_end_day_of_week pickup.sale_end_day_of_week
		json.sale_end_hour pickup.sale_end_hour
		json.sale_end_minute pickup.sale_end_minute
		json.pickup_day_of_week pickup.pickup_day_of_week
		json.pickup_start_hour pickup.pickup_start_hour
		json.pickup_start_minute pickup.pickup_start_minute
		json.pickup_end_hour pickup.pickup_end_hour
		json.pickup_end_minute pickup.pickup_end_minute
		json.next_pickup_date pickup.next_pickup_date
		json.formatted_pickup_time pickup.formatted_pickup_time
		json.formatted_sale_start_time pickup.formatted_sale_start_time
		json.is_in_sale_period pickup.is_in_sale_period
		json.next_sale_start_datetime pickup.next_sale_start_datetime
		json.next_sale_end_datetime pickup.next_sale_end_datetime
		json.address do
			json.name pickup.address.name
			json.street pickup.address.street
			json.street2 pickup.address.street2
			json.city pickup.address.city
			json.state pickup.address.state
			json.zip_code pickup.address.zip_code
		end
		json.orders pickup.orders do |order|
			json.consumer do
				json.id order.user.id
				json.first_name order.user.first_name
				json.last_name order.user.last_name
			end
			json.food_items order.order_sellable_food_items do |item|
				json.name item.sellable_food_item.food_item.name
				json.quantity_ordered item.quantity
				json.unit_cost item.unit_cost
				json.unit_label_singular item.sellable_food_item.food_item.unit_label_singular
				json.unit_label_plural item.sellable_food_item.food_item.unit_label_plural
				json.wholeseller do
					json.id item.sellable_food_item.wholeseller.id
					json.name item.sellable_food_item.wholeseller.name
				end
				
			end
		end		
	end
	
	json.order_pickup_schedules_for_packing @user.producer_entity.order_pickup_schedules_for_packing do |pickup|
		json.id pickup.id
		json.sale_start_day_of_week pickup.sale_start_day_of_week
		json.sale_start_hour pickup.sale_start_hour
		json.sale_start_minute pickup.sale_start_minute
		json.sale_end_day_of_week pickup.sale_end_day_of_week
		json.sale_end_hour pickup.sale_end_hour
		json.sale_end_minute pickup.sale_end_minute
		json.pickup_day_of_week pickup.pickup_day_of_week
		json.pickup_start_hour pickup.pickup_start_hour
		json.pickup_start_minute pickup.pickup_start_minute
		json.pickup_end_hour pickup.pickup_end_hour
		json.pickup_end_minute pickup.pickup_end_minute
		json.next_pickup_date pickup.next_pickup_date
		json.formatted_pickup_time pickup.formatted_pickup_time
		json.formatted_sale_start_time pickup.formatted_sale_start_time
		json.is_in_sale_period pickup.is_in_sale_period
		json.next_sale_start_datetime pickup.next_sale_start_datetime
		json.next_sale_end_datetime pickup.next_sale_end_datetime
		json.address do
			json.name pickup.address.name
			json.street pickup.address.street
			json.street2 pickup.address.street2
			json.city pickup.address.city
			json.state pickup.address.state
			json.zip_code pickup.address.zip_code
		end
		json.producer_entity do
			json.name pickup.producer_entity.name
		end
		
		json.orders pickup.orders do |order|
			json.consumer do
				json.id order.user.id
				json.first_name order.user.first_name
				json.last_name order.user.last_name
			end
			json.food_items order.order_sellable_food_items do |item|
				json.name item.sellable_food_item.food_item.name
				json.quantity_ordered item.quantity
				json.unit_cost item.unit_cost
				json.unit_label_singular item.sellable_food_item.food_item.unit_label_singular
				json.unit_label_plural item.sellable_food_item.food_item.unit_label_plural
				json.wholeseller do
					json.id item.sellable_food_item.wholeseller.id
					json.name item.sellable_food_item.wholeseller.name
				end
				
			end
		end			
	end
		
	next_pickup = @user.producer_entity.next_upcoming_order_pickup_schedule
	if (next_pickup) 

		json.next_upcoming_order_pickup_schedule do 
			json.id next_pickup.id
			json.sale_start_day_of_week next_pickup.sale_start_day_of_week
			json.sale_start_hour next_pickup.sale_start_hour
			json.sale_start_minute next_pickup.sale_start_minute
			json.sale_end_day_of_week next_pickup.sale_end_day_of_week
			json.sale_end_hour next_pickup.sale_end_hour
			json.sale_end_minute next_pickup.sale_end_minute
			json.pickup_day_of_week next_pickup.pickup_day_of_week
			json.pickup_start_hour next_pickup.pickup_start_hour
			json.pickup_start_minute next_pickup.pickup_start_minute
			json.pickup_end_hour next_pickup.pickup_end_hour
			json.pickup_end_minute next_pickup.pickup_end_minute
			json.next_pickup_date next_pickup.next_pickup_date
			json.formatted_pickup_time next_pickup.formatted_pickup_time
			json.formatted_sale_start_time next_pickup.formatted_sale_start_time
			json.is_in_sale_period next_pickup.is_in_sale_period
			json.next_sale_start_datetime next_pickup.next_sale_start_datetime
			json.next_sale_end_datetime next_pickup.next_sale_end_datetime
			json.address do
				json.name next_pickup.address.name
				json.street next_pickup.address.street
				json.street2 next_pickup.address.street2
				json.city next_pickup.address.city
				json.state next_pickup.address.state
				json.zip_code next_pickup.address.zip_code
			end
		end
	end
end
