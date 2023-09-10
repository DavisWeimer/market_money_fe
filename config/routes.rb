Rails.application.routes.draw do
  resources :markets, only: [:index, :show]
  resources :vendors, only: [:show]
end
