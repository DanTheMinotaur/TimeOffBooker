Rails.application.routes.draw do
  devise_for :users

  post '/', to: 'dashboard#request_time_off'

  get 'requests', to: 'dashboard#requests'

  post 'search', to: 'search#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
