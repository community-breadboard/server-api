Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/food_items_for_sale', to: 'food_items#index'
  get '/service_days', to: 'service_days#index'
  get '/me', to: 'users#show'
  get '/order_pickup_schedules', to: 'order_pickup_schedules#index'

end
