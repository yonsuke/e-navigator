Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: :index do
    resources :interviews
    post '/request_interview',   to: 'interviews#request_interview'
  end
end
