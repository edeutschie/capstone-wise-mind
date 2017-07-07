Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'quotes', to: 'quotes#index', as: 'quotes'

  get 'users', to: 'users#index', as: 'users'

end
