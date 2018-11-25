Rails.application.routes.draw do
	root 'static_pages#index'

	# Signing up
	get '/signup', to: 'user_account#new', as: 'signup'
	post '/signup', to: 'user_account#create'

	# Logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
