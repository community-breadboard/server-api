class UsersController < ApplicationController
	before_action :authenticate_user

	def show
		@user = current_user
	end

	# TODO add security around this
	def add_credit
#		current_user.update(balance: current_user.balance + params[:amount])
	end

	def submit_order
		if (current_user.id != params[:consumer][:id]) then
			raise Exception.new('Consumer ID does not match!')
		end

		current_datetime = Rails.configuration.x.fake_current_datetime || DateTime.current()
		
		if (params[:consumer][:family][:orderPickupSchedule]) then
			order_pickup_schedule = OrderPickupSchedule.find(params[:consumer][:family][:orderPickupSchedule][:id])			
			order = Order.create(user: current_user, order_pickup_schedule: order_pickup_schedule, total_cost: params[:outstandingOrder][:totalCost], datetime_placed: DateTime.current(), next_sale_start_datetime: params[:consumer][:family][:orderPickupSchedule][:nextSaleStartDate], next_pickup_date: params[:consumer][:family][:orderPickupSchedule][:nextPickupDate], formatted_pickup_time: params[:consumer][:family][:orderPickupSchedule][:formattedPickupTime], pickup_location_name: params[:consumer][:family][:orderPickupSchedule][:address][:name])
		else
			order = Order.create(user: current_user, total_cost: params[:outstandingOrder][:totalCost], datetime_placed: DateTime.current())
		end


		for sellable_food_item_json in params[:outstandingOrder][:foodItems] do
			sellable_food_item = SellableFoodItem.find(sellable_food_item_json[:sellableFoodItemId])

			order_sellable_food_item = OrderSellableFoodItem.create(order: order, sellable_food_item: sellable_food_item, quantity: sellable_food_item_json[:quantityOrdered], unit_cost: sellable_food_item_json[:unitCost])
		end

		current_user.update(balance: current_user.balance - order.total_cost)

		render json: {status: 'success'}

	end
end
