Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"
  get "about" => "pages#about", as: "about"
  get "contact" => "pages#contact", as: "contact"
  get "faq" => "pages#faq", as: "faq"

  root to: "home#index"
end
