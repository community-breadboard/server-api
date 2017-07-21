class ProducersController < ApplicationController
	before_action :authenticate_user
	before_action :verify_user_type
	
	def show
		@user = current_user
	end

	def verify_user_type
		if (current_user.type != 'Producer') then
			raise Exception.new('Invalid user type')
		end
	end
end
