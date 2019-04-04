Rails.application.routes.draw do
  resources :profiles
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
  get 'admin', to: 'admin#index'
  get 'admin/users', to: 'admin#users'
  get 'admin/populate', to: 'admin#populate'
  post 'admin/populate', to: 'admin#populate_holidays'
  get 'admin/permission', to: 'admin#permission'
  post 'admin/permission', to: 'admin#permission'
  post 'admin/grant_permissions', to: 'admin#grant_permissions'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#index'
end
