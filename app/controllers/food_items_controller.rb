class FoodItemsController < ApplicationController
	before_action :authenticate_user

	def index
		@food_categories = FoodCategory.includes(:food_items).where(food_items: {aggregator: current_user.family.aggregator})
	end
end
