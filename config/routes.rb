Rails.application.routes.draw do

  resources :supplies, only: [:index]
  resources :expenses, only: [:destroy]

  resources :parties, except: [:new, :edit] do
    resources :supplies, shallow: true #only: [:index, :create]
  end
  
end
