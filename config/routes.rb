Rails.application.routes.draw do

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :ideas do
    resources :comments

    resources :likes, only: [:create, :destroy]

    resources :joins, only: [:create, :destroy]
  end

  root "ideas#index"

end
