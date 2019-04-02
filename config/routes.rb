Rails.application.routes.draw do
  resources :holidays
  devise_for :users

  resource :users, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  post '/', to: 'dashboard#request_time_off'

  get 'requests', to: 'dashboard#requests'

  post 'search', to: 'search#index'
  get 'search', to: 'search#index'

  post 'requests/approve', to: 'dashboard#approve_time_off'

  get 'news', to: 'dashboard#news'
  get 'admin/users', to: 'admin#users'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
