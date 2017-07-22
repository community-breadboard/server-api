json.(@user, :id, :email, :first_name, :last_name)

json.producer_entity do
	json.id @user.producer_entity.id
	json.web_site_url @user.producer_entity.web_site_url
	json.name @user.producer_entity.name

	json.open_and_finalized_order_pickup_schedules_for_delivery @user.producer_entity.open_and_finalized_order_pickup_schedules_for_delivery do |pickup|
		json.next_sale_start_datetime pickup.next_sale_start_datetime
		json.orders pickup.orders do |order|
			json.consumer do
				json.id order.user.id
				json.first_name order.user.first_name
				json.last_name order.user.last_name
			end
			json.food_items order.order_sellable_food_items do |item|
				json.name item.sellable_food_item.food_item.name
				json.quantity item.quantity
				json.unit_cost item.unit_cost
				json.wholeseller do
					json.id item.sellable_food_item.wholeseller.id
					json.name item.sellable_food_item.wholeseller.name
				end
				
			end
		end		
	end
	
	json.open_and_finalized_order_pickup_schedules_for_packing_someone_else_will_deliver @user.producer_entity.open_and_finalized_order_pickup_schedules_for_packing_someone_else_will_deliver do |pickup|
		json.next_sale_start_datetime pickup.next_sale_start_datetime
		json.orders pickup.orders do |order|
			json.consumer do
				json.id order.user.id
				json.first_name order.user.first_name
				json.last_name order.user.last_name
			end
			json.food_items order.order_sellable_food_items do |item|
				json.name item.sellable_food_item.food_item.name
				json.quantity item.quantity
				json.unit_cost item.unit_cost
				json.wholeseller do
					json.id item.sellable_food_item.wholeseller.id
					json.name item.sellable_food_item.wholeseller.name
				end
				
			end
		end			
	end
	
	json.upcoming_order_pickup_schedules @user.producer_entity.upcoming_order_pickup_schedules do |pickup|
		json.next_sale_end_datetime pickup.next_sale_end_datetime
	end

end
