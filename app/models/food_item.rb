class FoodItem < ApplicationRecord
  belongs_to :food_category
  belongs_to :producer_entity
  has_many :order_food_items
  has_many :orders, :through => :order_food_items
end
