Rails.application.routes.draw do
  resources :clients
  resources :technologies
  resources :teams do
    member do
      get :assign_project
      post :assigned_project
      get :assign_member
      post :assigned_member
      get :assign_member_project
      post :assigned_member_project
      post :assigned_member_project_task
      get '/user/:user_id' => 'teams#users_details', as: :users_details
    end
  end
  resources :projects do
       resources :tasks do
            resources :dependencies
       end
  end
devise_for :users
root to: "home#dashboard"
end
