Rails.application.routes.draw do
  # get "pages/home", to: "pages#home"
  # get "pages/dashboard", to: "pages#dashboard"

  get "/signup", to: "registrations#new", as: :new_registration
  post "/signup", to: "registrations#create", as: :registration
  resource :session, except: %i[new]
  get "/login", to: "sessions#new", as: :new_session
  resources :passwords, param: :token

  resources :counties, only: %i[index show] do
    resources :towns, only: %i[index show]
  end

  resources :counties do
    get "food_pantries", on: :member
  end

  resources :food_pantries
  resources :counties, only: %i[index show]
  resources :towns, only: %i[index show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "counties#index"
end
