Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # get "signup", to: "users#new"
  # post "signup", to: "users#create"
  # resources :users, only: [:index, :show]

  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  get "about" => "pages#about", as: "about"
  get "contact" => "pages#contact", as: "contact"
  get "faq" => "pages#faq", as: "faq"

  resources :instruments, only: [:index, :show]
  resources :types, only: [:index, :show]
  resources :lessons, only: [:index, :show]

  root to: "home#index"
end
