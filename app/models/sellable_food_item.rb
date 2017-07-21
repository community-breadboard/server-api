class SellableFoodItem < ApplicationRecord
	belongs_to :food_item
	belongs_to :seller, :class_name => 'ProducerEntity'
	belongs_to :wholeseller, :class_name => 'ProducerEntity'
	
end
