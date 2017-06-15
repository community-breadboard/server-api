class SellableFoodItem < ApplicationRecord
	belongs_to :food_item
	belongs_to :seller, :class_name => 'ProducerEntity'
end
