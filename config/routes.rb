Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :personnalities, only: [:new, :create, :show, :index] do
    resources :rentals, only: [:create]
  end

  resources :reservations, only: [:index] do
    member do
      patch :accept
      patch :refuse
    end
  end
  resources :rentals, only: [:index]
end
