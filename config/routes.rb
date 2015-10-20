Rails.application.routes.draw do
  root "questions#index"

  resources :questions do
    resources :answers
    resources :votes
  end

  resources :answers do
    resources :votes
  end

  resources :votes
  resources :users

  namespace :admin, :only => [:index] do
    resources :users
    resources :questions
    resources :answers
    resources :votes
  end

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out
end
