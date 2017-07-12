class OrderSellableFoodItem < ApplicationRecord
  belongs_to :sellable_food_item
  belongs_to :order
end
