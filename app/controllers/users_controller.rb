class UsersController < ApplicationController
	before_action :authenticate_user

	def show
		@user = current_user
	end

	def submit_order
		if (current_user.id != params[:consumer][:id]) then
			raise Exception.new('Consumer ID does not match!')
		end

		order_pickup_schedule = OrderPickupSchedule.find(params[:consumer][:family][:orderPickupSchedule][:id])

		order = Order.create(user: current_user, order_pickup_schedule: order_pickup_schedule, total_cost: params[:outstandingOrder][:totalCost], status: 'open', date_placed: Date.current())

		for sellable_food_item_json in params[:outstandingOrder][:foodItems] do
			sellable_food_item = SellableFoodItem.find(sellable_food_item_json[:sellableFoodItemId])

			order_sellable_food_item = OrderSellableFoodItem.create(order: order, sellable_food_item: sellable_food_item, quantity: sellable_food_item_json[:quantityOrdered], unit_cost: sellable_food_item_json[:unitCost])
		end

		render json: {status: 'success'}


	end
end
