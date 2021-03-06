Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'

  resources :users, only: [:show, :edit, :update] do
    resources :recipes
    resources :ratings
  end

  resources :ingredients
  resources :inventories
  resources :ratings, only: [:destroy]

  resources :recipes do
    resources :ratings
    post 'search', on: :collection
  end
  get '/recipes/:id/remove', to: 'recipes#remove'
  get 'search', to: 'recipes#search'
  resources :recipe_ingredients, only: [:show, :new, :create, :edit, :update, :destroy]

  namespace :admin do
    resources :users, only: [:index, :show, :destroy, :ban]
    get '/users/:id/ban', to: 'users#ban'
    get '/users/:id/unban', to: 'users#unban'
  end

end
