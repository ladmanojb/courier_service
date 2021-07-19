Rails.application.routes.draw do
	require 'sidekiq/web'
	mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'orders#index'

  resources :orders do 
  	get :search, :on => :collection
  end

end
