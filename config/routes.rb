Rails.application.routes.draw do

  devise_for :users

  get 'brands/directory', to: "brands#directory", as: :brands_directory
  get 'brands/index_inventory', to: "brands#index_inventory", as: :brands_index_inventory
  resources :brands, only: [:show, :index, :new, :create, :update, :edit] do
    resources :products, only: [:new, :create, :show, :edit, :update, :index] do
      get 'product_refs/auto_new', to: "product_refs#auto_new", as: :auto_new_product_ref
      post 'product_refs/auto_create', to: "product_refs#auto_create", as: :auto_create_product_ref
      resources :product_refs, only: [:new, :create, :show, :edit, :update, :index, :destroy]

    end
  end
  get 'users/home_inventory', to: "users#home_inventory", as: :users_home_directory
  get 'supply_batches/brand_choice', to: "supply_batches#brand_choice", as: :supply_batches_brand_choice
  resources :supply_batches, only: [:show, :index, :new, :create, :update, :edit] do
    get 'supply_batch_items/selection', to: "supply_batch_items#selection", as: :supply_batch_items_selection
    get 'supply_batch_items/finalization', to: "supply_batch_items#finalization", as: :supply_batch_items_finalization
    resources :supply_batch_items, only: [:update]
  end
end
