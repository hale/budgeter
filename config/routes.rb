Budgeter::Application.routes.draw do
  resources :categories

  resources :expenses

  root 'home#dashboard'

 get 'dashboard(/:year/:month)', :to => 'home#dashboard', :as => :dashboard_path

end
