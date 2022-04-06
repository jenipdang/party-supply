Rails.application.routes.draw do

  resources :parties, except: [:new, :edit] do
    resources :supplies, shallow: true #only: [:index, :create]
  end
  
end
