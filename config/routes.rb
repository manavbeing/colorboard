Rails.application.routes.draw do
    root 'primary#index'
    post '/primary/Changeboardcolor'
    get '/primary/leaderboard'
    get '/primary/refresh_tiles'
	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
