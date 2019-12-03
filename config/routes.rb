Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :shares do
    resources :comments
  end
  get "/users", to: "users#index"
  root "shares#index"
  resources :conversations do
    resources :messages
  end
  resources :relationships, only: [:create, :destroy]
  if Rails.env.develpment?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
