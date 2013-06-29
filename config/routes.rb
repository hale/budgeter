Budgeter::Application.routes.draw do
  resources :categories

  resources :transactions

  root :to => 'home#dashboard'

   get 'dashboard', :to => 'home#dashboard', :as => :dashboard_path

end
