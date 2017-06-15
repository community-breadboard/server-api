class Order < ApplicationRecord
  belongs_to :user
  has_many :order_food_items
  has_many :food_items_for_sale, :through => :order_food_items
end
