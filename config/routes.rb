Rails.application.routes.draw do
  namespace :public do
    get 'cart_products/index'
    get 'cart_products/create'
    get 'cart_products/update'
    get 'cart_products/destroy'
    get 'cart_products/destroy_all'
  end
  namespace :admin do
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: :update
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :products, only: [:index, :show]
    get 'products/genre' => 'products#search'
    resource :customers, only: [:edit, :update]
    get 'customers/my_page' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    get 'customers/withdraw' => 'customers#withdraw'
    resources :cart_products, only: [:index, :create, :update, :destroy]
    delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    resources :orders, only: [:index, :show, :new, :create]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'
    resources :shipping_adresses, only: [:index, :create, :destroy, :edit, :update]

  end
  devise_scope :admins do
    get 'admin' => 'devise/sessions#new', as: :new_admin_session
    post 'admin' => 'devise/sessions#create', as: :admin_session
    delete 'logout' => 'devise/sessions#destroy', as: :destroy_admin_session
  end

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
