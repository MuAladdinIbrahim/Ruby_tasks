Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  resources :users
  #this will the entry point to my app
  #maps http://localhost:3000 >> http://localhost:3000/welcome/index  
  root 'welcome#index'
end
