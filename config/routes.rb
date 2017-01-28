Rails.application.routes.draw do
  resource :home, only: [:index, :create], controller: :home

  root 'home#index'
end
