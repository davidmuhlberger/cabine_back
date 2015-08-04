Rails.application.routes.draw do

  devise_for :users

  get 'brands/directory', to: "brands#directory", as: :brands_directory
  resources :brands, only: [:show, :index, :new, :create, :update, :edit] do
    resources :products, only: [:new, :create, :show, :edit, :update, :index] do
      get 'product_refs/auto_new', to: "product_refs#auto_new", as: :auto_new_product_ref
      post 'product_refs/auto_create', to: "product_refs#auto_create", as: :auto_create_product_ref
      resources :product_refs, only: [:new, :create, :show, :edit, :update, :index, :destroy]

    end
  end

  get 'users/home_inventory', to: "users#home_inventory", as: :users_home_directory
end
