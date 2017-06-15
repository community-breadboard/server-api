class FoodItemsController < ApplicationController
	before_action :authenticate_user

	def index
		@food_categories = FoodCategory.includes(:food_items).includes(:sellable_food_items).where(sellable_food_items: {seller: current_user.family.producer_entity})
	end
end
