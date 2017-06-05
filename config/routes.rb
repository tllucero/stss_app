Rails.application.routes.draw do
  resources :stss_trades
  get 'monte_carlo/new'
  post 'monte_carlo/new'
  root :to => 'monte_carlo#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
