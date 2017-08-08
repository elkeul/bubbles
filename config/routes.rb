Rails.application.routes.draw do
  root to: 'home#index'
  #root to: 'layouts#application'

  devise_for :divers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # only: [:index, :show, :new, :create, :destroy, :edit, :delete, :update]
  resources :divers do
  # resources :divers, only: [:index, :show]  do |variable|
    resources :dives
  end
  resources :dive_types
end
