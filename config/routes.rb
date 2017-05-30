Rails.application.routes.draw do
  resources :stss_trades
  get 'monte_carlo/home'
  root :to => 'monte_carlo#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
