class FoodItem < ApplicationRecord
	belongs_to :food_category
	belongs_to :producer_entity
	belongs_to :aggregator
	has_many :order_food_items
	has_many :orders, :through => :order_food_items
end
