Rails.application.routes.draw do
  root to: "tasks#index"

  resources :tasks

  namespace :admin do
    resources :users, only:[:new,:create,:show]
  end
  
  resources :sessions, only:[:new,:create,:destroy]
end
