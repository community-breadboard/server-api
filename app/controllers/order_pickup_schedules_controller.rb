class OrderPickupSchedulesController < ApplicationController
	before_action :authenticate_user

	def index
		@order_pickup_schedules = OrderPickupSchedule.where({producer_entity: current_user.family.producer_entity})
	end
end
