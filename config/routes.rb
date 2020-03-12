Rails.application.routes.draw do 
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :products, only: [:index, :create, :new]  do 
    resources :reviews, only: [:index, :new]
  end 
  resources :reviews, only: :create
  get '/products/makeup', to: 'products#makeup'
  get '/products/cleanser', to: 'products#cleanser'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  
end
