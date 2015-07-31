Rails.application.routes.draw do

  devise_for :users

  get 'brands/directory', to: "brands#directory", as: :brands_directory
  resources :brands, only: [:show, :index, :new, :create, :update, :edit]


end
