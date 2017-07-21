json.(@user, :id, :email, :first_name, :last_name)

json.producer_entity do
	json.id @user.producer_entity.id
	json.web_site_url @user.producer_entity.web_site_url
	json.name @user.producer_entity.name

	json.order_pickup_schedules_for_delivery @user.producer_entity.order_pickup_schedules
	
	json.order_pickup_schedules_for_packing_someone_else_will_deliver @user.producer_entity.order_pickup_schedules_for_packing_someone_else_will_deliver
end
