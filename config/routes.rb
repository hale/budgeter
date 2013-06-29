Budgeter::Application.routes.draw do
  resources :categories

  resources :transactions

  root :to => 'transactions#index'

end
