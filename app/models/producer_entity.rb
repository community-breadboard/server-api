class ProducerEntity < ApplicationRecord
	has_one :address, as: :addressable
	has_many :producers
	has_many :order_pickup_schedules
		
	# Seller delivers the order
	def open_and_finalized_order_pickup_schedules_for_delivery
		order_pickup_schedules.select {|order_pickup_schedule| !order_pickup_schedule.is_in_sale_period }
	end
	# Wholeseller packs their portion of the order
	def order_pickup_schedules_for_packing_someone_else_will_deliver
		OrderPickupSchedule.find_by_sql(["select distinct ops.* from order_pickup_schedules ops join producer_entities pe on (ops.producer_entity_id = pe.id) join sellable_food_items sfi on (sfi.seller_id = pe.id) where sfi.wholeseller_id = ? and sfi.seller_id != ?", id, id])
	end

	def open_and_finalized_order_pickup_schedules_for_packing_someone_else_will_deliver
		order_pickup_schedules_for_packing_someone_else_will_deliver.select {|order_pickup_schedule| !order_pickup_schedule.is_in_sale_period }
	end
	
	def upcoming_order_pickup_schedules
		order_pickup_schedules.select {|order_pickup_schedule| order_pickup_schedule.is_in_sale_period } + order_pickup_schedules_for_packing_someone_else_will_deliver.select {|order_pickup_schedule| order_pickup_schedule.is_in_sale_period }
	end
end
