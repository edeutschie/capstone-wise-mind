Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
theme_constraints = {
  theme: /(Motivational)|(Creativity)|(My Quotes)|(Shuffle)/
}

  # get 'quotes(/:theme)', to: 'quotes#index', as: 'quotes', constraints: theme_constraints

  get 'quotes(/:theme)', to: 'quotes#theme', as: 'theme_quotes', constraints: theme_constraints

  get 'quotes', to: 'quotes#index', as: 'quotes'
  get 'quotes/:id', to:'quotes#show', as: 'quote'
  post 'quotes', to: 'quotes#create'
  delete 'quotes/:id', to: 'quotes#destroy'
  # get 'quotes(/:theme)', to: 'quotes#theme', as: 'theme_quotes', constraints: theme_constraints

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'
  delete 'users/:id', to: 'users#destroy'

  # get 'users/:id/daily_quote', to: 'users', as: 'daily_quote'
  get 'users/:id/quotes', to: 'users#submitted_quotes', as: 'submitted_quotes'

end
