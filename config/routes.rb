Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
  get 'homes/about' => 'homes#about', as: 'about'
end
