Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get "/my_tasks", to: "home#my_tasks"
  resources :projects, :tasks
end
