Rails.application.routes.draw do
	root 'static_pages#index'

	# Signing up
	get '/signup', to: 'user_account#new', as: 'signup'
	post '/signup', to: 'user_account#create'

	# Logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Handling meetings
  get '/meetings', to: 'meetings#index'
  post '/meetings', to: 'meetings#create'
  get '/meetings/:id', to: 'meetings#show', as: 'show_meeting'
  post '/meetings/:id', to: 'meetings#attendance', as: 'set_attendence'
  delete '/meetings/:id', to: 'meetings#destroy'
end
