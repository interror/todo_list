TodoList::Application.routes.draw do

  root to: 'projects#index'
  resources :projects do 
    resources :tasks
  end
  
end
