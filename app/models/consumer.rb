class Consumer < User
	belongs_to :family
	has_many :orders, foreign_key: 'user_id'
	
	def can_place_order
		
		return ((most_recent_order.nil? || !most_recent_order.is_open) && (family.order_pickup_schedule.is_in_sale_period))
		
	end
	
	def most_recent_order
		orders.order(:datetime_placed).last
	end
end
