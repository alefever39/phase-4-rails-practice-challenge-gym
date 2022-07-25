Rails.application.routes.draw do
  resources :memberships, only: :create
  resources :clients, only: %i[index show update]
  resources :gyms, only: %i[index show update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
