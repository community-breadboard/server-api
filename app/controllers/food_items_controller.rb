class FoodItemsController < ApplicationController
	def index
		@food_categories = FoodCategory.includes(:food_items)
	end
end
