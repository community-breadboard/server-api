class ProducerEntity < ApplicationRecord
	has_one :address, as: :addressable
	has_many :producers
	has_many :order_pickup_schedules
		
	# Seller delivers the order
	def order_pickup_schedules_for_delivery
		order_pickup_schedules.select {|order_pickup_schedule| !order_pickup_schedule.is_in_sale_period }
	end
	# Wholeseller packs their portion of the order
	def all_order_pickup_schedules_for_packing
		OrderPickupSchedule.find_by_sql(["select distinct ops.* from order_pickup_schedules ops join producer_entities pe on (ops.producer_entity_id = pe.id) join sellable_food_items sfi on (sfi.seller_id = pe.id) where sfi.wholeseller_id = ? and sfi.seller_id != ?", id, id])
	end

	def order_pickup_schedules_for_packing
		all_order_pickup_schedules_for_packing.select {|order_pickup_schedule| !order_pickup_schedule.is_in_sale_period }
	end
	
	def next_upcoming_order_pickup_schedule
		all_in = order_pickup_schedules.select {|order_pickup_schedule| order_pickup_schedule.is_in_sale_period }
		all_pack = all_order_pickup_schedules_for_packing.select {|order_pickup_schedule| order_pickup_schedule.is_in_sale_period }
		all_in_sale_period = all_in + all_pack
		
		#TODO Test this to make sure the order is correct
		sorted_all_in_sale_period = all_in_sale_period.sort_by { |pickup| pickup.next_sale_end_datetime }
		next_upcoming_order_pickup_schedule = sorted_all_in_sale_period.first
		next_upcoming_order_pickup_schedule
	end
end
