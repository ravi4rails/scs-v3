Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: "admins/sessions", registrations: "admins/registrations", confirmations: "admins/confirmations", passwords: "admins/passwords" }
  get 'home/index'
  get '/dashboard' => "home#dashboard"
  get '/timetables' => "home#timetables"
  get '/work_allotment' => "timetable#work_allotment"
  root "home#index"


  namespace :admins do
    resources :students
    resources :departments
    resources :courses do
      collection do
        post :include_subjects
      end
    end
    resources :course_subjects, :only => [:destroy]
    resources :subjects
    resources :employees
    resources :events do
      collection do
        get :calendar_events
        get :calendar
        get :get_event
      end
    end
  end

end
