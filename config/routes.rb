Rails.application.routes.draw do

  namespace :pages do
    get 'home'
    get 'dashboard'
  end
  resources :initiatives do
    resources :commitments, controller: 'initiatives/commitments' do
      member do
          patch :complete
      end
    end
  end
  resources :commitments
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
