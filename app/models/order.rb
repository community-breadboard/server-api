class Order < ApplicationRecord
	belongs_to :user
	belongs_to :order_pickup_schedule
	has_many :order_sellable_food_items
	has_many :sellable_food_items, :through => :order_sellable_food_items
	has_many :food_items, :through => :sellable_food_items

	def is_open
	  return (Date.current < next_sale_start_datetime)
	end
end
