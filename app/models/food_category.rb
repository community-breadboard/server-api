class FoodCategory < ApplicationRecord
	has_many :food_items
	has_many :sellable_food_items, through: :food_items
end
