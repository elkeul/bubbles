Rails.application.routes.draw do
  root to: 'divers#index'
  #root to: 'layouts#application'

  devise_for :divers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :divers
end
