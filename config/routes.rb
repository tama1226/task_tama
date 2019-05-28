Rails.application.routes.draw do
  namespace :admin do
    get 'users/new'
    get 'users/edit'
    get 'users/show'
    get 'users/index'
  end
  root to: "tasks#index"

  resources :tasks

  namespace :admin do
    resources :users, only:[:new,:create,:show]
  end
  
  resources :sessions, only:[:new,:create,:destroy]
end
