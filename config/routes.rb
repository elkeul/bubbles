Rails.application.routes.draw do

  authenticated :user do
    root 'divers#index', as: :root #-> if user is logged in
    resources :divers #-> ONLY available for logged in users
  end

  unauthenticated :user do
    root 'home#index', as: :unauthenticated #-> if user is not logged in
  end

  #root to: 'home#index'
  #root to: 'layouts#application'

  devise_for :divers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # only: [:index, :show, :new, :create, :destroy, :edit, :delete, :update]
  resources :divers do
  # resources :divers, only: [:index, :show]  do |variable|
    resources :dives
  end
  resources :dive_types

  get "search", to: "dives#search"
end
