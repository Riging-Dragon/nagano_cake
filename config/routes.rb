Rails.application.routes.draw do
  devise_for :admins
  #論理削除のため、コード追加
  devise_for :customers :controllers => { :registrations => 'customers/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #管理者側
  namespace :admin do
  	root 'homes#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:index, :edit, :create, :update]
  	resources :customers, only: [:index, :show, :edit, :update]
  	resources :order_details , only: [:index, :show]
  end
  #顧客側
  root 'homes#top'
  get 'home/about' => 'homes#about', as 'about'
  resources :products, only: [:index, :show]
  resources :cart_items, except: [:show, :edit, :new]
  resource :orders, only: [:new, :create]  do
  	get 'orders' => 'orders#top', as 'orders'
  end
  resource :customers, only: [:show, :edit, :update]  do
  	get 'customer/resign' => 'customer#resign', as 'resign'
  end
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :order_details, only: [:index, :show]
end
