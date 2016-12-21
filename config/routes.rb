Rails.application.routes.draw do

  resources :cookbooks do
    resources :recipes, except: [:index]
  end
  resources :users, only: [:new, :create, :edit, :update]
  resources :searches, only: [:create, :show]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')  
  get    '/signup',  to: 'users#new'
  post	 '/signup',	 to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end