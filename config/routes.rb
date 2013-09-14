Budgeter::Application.routes.draw do
  resources :incomes

  resources :categories

  resources :expenses

  root 'home#dashboard'

  get 'dashboard(/:year/:month)', :to => 'home#dashboard', :as => :dashboard_path

  post '/parse_date', :to => 'utilities#parse_date'

end
