TodoList::Application.routes.draw do

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions

  root to: 'projects#index'

  resources :projects do 
    resources :tasks do
    	member do
    		get :up
    		get :down
    	end
    end
  end

  get '/task/:id/toggle', to: "tasks#toggle"
  
end
