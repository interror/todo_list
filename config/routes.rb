TodoList::Application.routes.draw do

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
