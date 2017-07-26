Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/auth/github', to: 'authentication#github', format: false

  get '/auth/github/callback', to: 'authentication#github', format: false

  post 'notifications/notify' => 'notifications#notify'

theme_constraints = {
  theme: /(motivational)|(creativity)|(adies_in_internship)/
}

  get 'quotes', to: 'quotes#index', as: 'quotes'
  get 'quotes(/:theme)', to: 'quotes#theme', as: 'theme_quotes', constraints: theme_constraints
  # get 'quotes(/:theme)/daily_quote', to: 'quotes#daily_quote', as: 'daily_quote'
  get 'quotes/daily_quote', to: 'quotes#daily_quote', as: 'daily_quote'


  # get 'quotes', to: 'quotes#index', as: 'quotes'
  get 'quotes/:id', to:'quotes#show', as: 'quote'
  # post 'quotes', to: 'quotes#create'
  # delete 'quotes/:id', to: 'quotes#destroy'

  # get 'users', to: 'users#index', as: 'users'
  post 'users', to: 'users#create'

  get 'users/:login', to: 'users#show', as: 'user'
  patch 'users/:login', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'


  # get 'users/:id/daily_quote', to: 'users', as: 'daily_quote'
  # get 'users/:id/quotes', to: 'users#submitted_quotes', as: 'submitted_quotes'

  get 'dailyquotes(/:theme)', to: 'daily_quotes#show', as: 'dailyquote', constraints: theme_constraints

end
