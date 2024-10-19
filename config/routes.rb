Rails.application.routes.draw do
  resources :categories do
    resources :tasks
  end
  
  resources :tasks do
    member do
      get 'complete'
    end
  end
  
  
  root "tasks#index"
end
