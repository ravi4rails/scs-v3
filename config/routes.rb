Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: "admins/sessions", registrations: "admins/registrations", confirmations: "admins/confirmations", passwords: "admins/passwords" }
  get 'home/index'
  get '/dashboard' => "home#dashboard"
  root "home#index"


  namespace :admins do
    resources :students
    resources :departments
    resources :courses
    resources :subjects
  end

end