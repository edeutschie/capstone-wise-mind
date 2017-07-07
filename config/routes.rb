Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'quotes', to: 'quotes#index', as: 'quotes'
  get 'quotes/:id', to:'quotes#show', as: 'quote'
  post 'quotes', to: 'quotes#create'

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'

end
