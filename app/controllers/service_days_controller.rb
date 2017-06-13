class ServiceDaysController < ApplicationController
	before_action :authenticate_user

	def index
		@service_days = ServiceDay.where({producer_entity: current_user.family.aggregator})
	end
end
