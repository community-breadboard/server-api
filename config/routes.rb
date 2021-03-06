Rails.application.routes.draw do
	post 'user_token' => 'user_token#create'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	get '/current_user', to: 'users#show'  
	get '/current_user/food_items_for_sale', to: 'food_items#index'
	get '/current_user/service_days', to: 'service_days#index'
	get '/current_user/order_pickup_schedules', to: 'order_pickup_schedules#index'
	post '/current_user/submit_order', to: 'users#submit_order'
	post '/current_user/add_credit', to: 'users#add_credit'
	
	get '/current_producer', to: 'producers#show'
end
