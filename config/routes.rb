Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit, :index]
  get 'homes/about' => 'homes#about', as: 'about'
end
