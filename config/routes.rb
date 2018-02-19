Rails.application.routes.draw do
  resources :stss_trades
  get  '/', to: 'monte_carlo#new'
#  post '/', to: 'monte_carlo#create'
  post '/monte_carlo/new', to: 'monte_carlo#create'
  get '/show', to: 'monte_carlo#show'
  root :to => 'monte_carlo#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
