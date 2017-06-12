Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/food_items', to: 'food_items#index'
  get '/me', to: 'users#show'

end
