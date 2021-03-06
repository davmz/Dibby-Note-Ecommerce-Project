Rails.application.routes.draw do
  resources :users, only: [:index]

  devise_for :users, controllers: { confirmations: 'users/confirmations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post "instruments/add_to_cart/:id", to: "instruments#add_to_cart", as: "add_to_cart"
  delete "instruments/remove_from_cart/:id", to: "instruments#remove_from_cart", as: "remove_from_cart"
  resources :carts, only: [:index]

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  get "search", to: "instruments#search"

  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  # get "about" => "pages#about", as: "about"
  # get "contact" => "pages#contact", as: "contact"
  # get "faq" => "pages#faq", as: "faq"

  resources :instruments, only: [:index, :show]
  resources :types, only: [:index, :show]
  resources :lessons, only: [:index, :show]

  root to: "home#index"
end
