Nch::Application.routes.draw do
  devise_for :users, :controllers => {
    registrations: "users/registrations", passwords: "users/passwords"
  }

  devise_scope :user do
    get    "login",           to: "devise/sessions#new"
    delete "logout",          to: "devise/sessions#destroy"
    get    "signup",          to: "devise/registrations#new"
    get     "reset-password", to: "users/passwords#new"
    get     "account",        to: "devise/registrations#edit"
  end

  get "home/index"

  root to: "home#index"
end
