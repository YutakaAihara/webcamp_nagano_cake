Rails.application.routes.draw do
  
  namespace :admin do
    get '/' => 'orders#index'
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
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
  devise_for :admins

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
