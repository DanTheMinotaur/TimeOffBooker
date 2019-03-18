Rails.application.routes.draw do
  devise_for :users

  post 'dashboard/index'

  get 'requests', to: 'dashboard#requests'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
