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
  get 'supplies/brand_choice', to: "supplies#brand_choice", as: :supplies_brand_choice
  get 'supplies/:id/cancel', to: "supplies#cancel", as: :supplies_cancel
  get 'supplies/:id/reception_date', to: "supplies#reception_date", as: :supplies_reception_date
  patch 'supplies/:id/reception', to: "supplies#reception", as: :supplies_reception
  resources :supplies, only: [:show, :index, :new, :create, :update, :edit] do
    get 'supply_batch_items/reception', to: "supply_batch_items#reception", as: :supply_batch_items_reception
    get 'supply_batch_items/finalization_received_quantity', to: "supply_batch_items#finalization_received_quantity", as: :supply_batch_items_finalization_received_quantity
    patch 'supply_batch_items/update_received_quantity/:id', to: "supply_batch_items#update_received_quantity", as: :supply_batch_items_update_received_quantity
    resources :supply_batches, only: [:show, :index, :new, :create, :update, :edit] do
      get 'supply_batch_items/selection', to: "supply_batch_items#selection", as: :supply_batch_items_selection
      get 'supply_batch_items/finalization', to: "supply_batch_items#finalization", as: :supply_batch_items_finalization
      get 'supply_batch_items/finalization_new', to: "supply_batch_items#finalization_new", as: :supply_batch_items_finalization_new
      resources :supply_batch_items, only: [:update]
    end
  end
end
