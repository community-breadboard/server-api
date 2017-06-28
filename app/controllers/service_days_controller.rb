class ServiceDaysController < ApplicationController
	before_action :authenticate_user

	def index
		@service_days = ServiceDay.where({producer_entity: current_user.family.producer_entity})
	end
end
