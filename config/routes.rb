Rails.application.routes.draw do
    root 'primary#index'
    post '/primary/Changeboardcolor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
