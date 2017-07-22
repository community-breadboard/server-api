class OrdersController < ApplicationController
	before_action :authenticate_user
	before_action :verify_user_type
	
	def verify_user_type
		if (current_user.type != 'Producer') then
			raise Exception.new('Invalid user type')
		end
	end

	def index
		order_pickup_schedule = OrderPickupSchedule.find(:id)
	end
