Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :pages, except: [:show]
  get '/pages/:permalink' => "pages#permalink", as: 'permalink'

  root to: "home#index"
end
