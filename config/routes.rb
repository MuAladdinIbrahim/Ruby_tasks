Rails.application.routes.draw do
  devise_for :users  do
        get   "users/sign_up" => "users/registrations#new", :as => :user_signup
        get   "users/sign_in" => "main#index", :as => :user_signin
        get   "users/sign_out" => "devise/sessions#destroy", :as => :user_signout

      end

  resources :articles do
    resources :comments
  end

  # resources :users
  #this will the entry point to my app
  #maps http://localhost:3000 >> http://localhost:3000/welcome/index  
  root 'welcome#index'
end
