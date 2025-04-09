Rails.application.routes.draw do
  resources :projects do
    resources :project_events, only: :index

    resources :comment_events, only: :create
    resources :status_change_events, only: :create
    resources :project_name_change_events, only: :create
  end
  root "projects#index"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
