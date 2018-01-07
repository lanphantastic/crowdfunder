Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#show"

  get 'login' => 'user_sessions#new', :as => :login
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :projects, only: [:index, :new, :create, :show] do
    resources :pledges, only: [:create]
    resources :rewards, only: [:new, :create, :destroy]
    resources :claims, only: [:create] # added route for the new claims table, we only want to create a new record like pledges
    resources :comments, only: %i(create destroy update edit)
    resources :updates, only: %i(create destroy update edit)
  end

  resources :users, only: [:new, :create, :show] do
    resources :comments, only:[:create, :edit, :update, :destroy]
  end

   resources :user_sessions, only: [:create]

end
