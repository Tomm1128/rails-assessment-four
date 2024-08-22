Rails.application.routes.draw do
  resources :rooms, only: [:index, :show] do
    resources :house_plants, only: [:new]
  end
  resources :house_plants, only: [:index, :show, :create]
end
