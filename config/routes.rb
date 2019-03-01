Rails.application.routes.draw do
  namespace :pages do
    get 'home'
  end
  resources :initiatives
  resources :commitments
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
