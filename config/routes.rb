Rails.application.routes.draw do
  devise_for :users
  root to: 'dogs#index'

  get 'my_dogs', to: 'dogs#my_dogs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dogs do
    resources :meetings, only: [:new, :create]
  end
  resources :meetings, only: [:index, :show, :edit, :update, :destroy] do
    member do
      get "validate"
      get "refuse"
    end
  end
end
