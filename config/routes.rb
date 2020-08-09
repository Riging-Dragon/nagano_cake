Rails.application.routes.draw do
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #管理者側
  namespace :admins do
  	root 'homes#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:index, :edit, :create, :update]
  	resources :customers, only: [:index, :show, :edit, :update]
  	resources :orders , only: [:index, :show, :update]
  end
  #顧客側
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'orders' => 'orders#top', as: 'orders'
  #アプリケーション詳細設計に追加して、注文確認viewを追加
  get 'orders/:id/confirm' => 'orders#confirm', as: 'confirm'
  get 'customers/resign_page' => 'customers#resign_page', as: 'resign_page'
  #customers/registrations#editで/customers/edit(.:format)を使用しているため、URLを個別指定。
  get 'customers/my_page' => 'customers#edit', as: 'my_page'
  patch 'customers/resign' => 'customers#resign', as: 'resign'
  delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'

  resources :products, only: [:index, :show]
  resources :cart_items, except: [:show, :edit, :new]
  resource :orders, only: [:new, :create] 
  resource :customers, only: [:show,  :update] 
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :order_details, only: [:index, :show]
end

=begin
 Prefix Verb   URI Pattern                                                                              Controller#Action
         admins_orders_index GET    /admins/orders/index(.:format)                                                           admins/orders#index
          admins_orders_show GET    /admins/orders/show(.:format)                                                            admins/orders#show
           new_admin_session GET    /admins/sign_in(.:format)                                                                devise/sessions#new
               admin_session POST   /admins/sign_in(.:format)                                                                devise/sessions#create
       destroy_admin_session DELETE /admins/sign_out(.:format)                                                               devise/sessions#destroy
          new_admin_password GET    /admins/password/new(.:format)                                                           devise/passwords#new
         edit_admin_password GET    /admins/password/edit(.:format)                                                          devise/passwords#edit
              admin_password PATCH  /admins/password(.:format)                                                               devise/passwords#update
                             PUT    /admins/password(.:format)                                                               devise/passwords#update
                             POST   /admins/password(.:format)                                                               devise/passwords#create
   cancel_admin_registration GET    /admins/cancel(.:format)                                                                 devise/registrations#cancel
      new_admin_registration GET    /admins/sign_up(.:format)                                                                devise/registrations#new
     edit_admin_registration GET    /admins/edit(.:format)                                                                   devise/registrations#edit
          admin_registration PATCH  /admins(.:format)                                                                        devise/registrations#update
                             PUT    /admins(.:format)                                                                        devise/registrations#update
                             DELETE /admins(.:format)                                                                        devise/registrations#destroy
                             POST   /admins(.:format)                                                                        devise/registrations#create
        new_customer_session GET    /customers/sign_in(.:format)                                                             devise/sessions#new
            customer_session POST   /customers/sign_in(.:format)                                                             devise/sessions#create
    destroy_customer_session DELETE /customers/sign_out(.:format)                                                            devise/sessions#destroy
       new_customer_password GET    /customers/password/new(.:format)                                                        devise/passwords#new
      edit_customer_password GET    /customers/password/edit(.:format)                                                       devise/passwords#edit
           customer_password PATCH  /customers/password(.:format)                                                            devise/passwords#update
                             PUT    /customers/password(.:format)                                                            devise/passwords#update
                             POST   /customers/password(.:format)                                                            devise/passwords#create
cancel_customer_registration GET    /customers/cancel(.:format)                                                              devise/registrations#cancel
   new_customer_registration GET    /customers/sign_up(.:format)                                                             devise/registrations#new
  edit_customer_registration GET    /customers/edit(.:format)                                                                devise/registrations#edit
       customer_registration PATCH  /customers(.:format)                                                                     devise/registrations#update
                             PUT    /customers(.:format)                                                                     devise/registrations#update
                             DELETE /customers(.:format)                                                                     devise/registrations#destroy
                             POST   /customers(.:format)                                                                     devise/registrations#create
                 admins_root GET    /admins(.:format)                                                                        admins/homes#top
             admins_products GET    /admins/products(.:format)                                                               admins/products#index
                             POST   /admins/products(.:format)                                                               admins/products#create
          new_admins_product GET    /admins/products/new(.:format)                                                           admins/products#new
         edit_admins_product GET    /admins/products/:id/edit(.:format)                                                      admins/products#edit
              admins_product GET    /admins/products/:id(.:format)                                                           admins/products#show
                             PATCH  /admins/products/:id(.:format)                                                           admins/products#update
                             PUT    /admins/products/:id(.:format)                                                           admins/products#update
               admins_genres GET    /admins/genres(.:format)                                                                 admins/genres#index
                             POST   /admins/genres(.:format)                                                                 admins/genres#create
           edit_admins_genre GET    /admins/genres/:id/edit(.:format)                                                        admins/genres#edit
                admins_genre PATCH  /admins/genres/:id(.:format)                                                             admins/genres#update
                             PUT    /admins/genres/:id(.:format)                                                             admins/genres#update
            admins_customers GET    /admins/customers(.:format)                                                              admins/customers#index
        edit_admins_customer GET    /admins/customers/:id/edit(.:format)                                                     admins/customers#edit
             admins_customer GET    /admins/customers/:id(.:format)                                                          admins/customers#show
                             PATCH  /admins/customers/:id(.:format)                                                          admins/customers#update
                             PUT    /admins/customers/:id(.:format)                                                          admins/customers#update
               admins_orders GET    /admins/orders(.:format)                                                                 admins/orders#index
                admins_order GET    /admins/orders/:id(.:format)                                                             admins/orders#show
                             PATCH  /admins/orders/:id(.:format)                                                             admins/orders#update
                             PUT    /admins/orders/:id(.:format)                                                             admins/orders#update
                        root GET    /                                                                                        homes#top
                       about GET    /homes/about(.:format)                                                                   homes#about
                      orders GET    /orders(.:format)                                                                        orders#top
                     confirm GET    /orders/:id/confirm(.:format)                                                            orders#confirm
                 resign_page GET    /customers/resign_page(.:format)                                                         customers#resign_page
                     my_page GET    /customers/my_page(.:format)                                                             customers#edit
                      resign PATCH  /customers/resign(.:format)                                                              customers#resign
                 destroy_all DELETE /cart_items(.:format)                                                                    cart_items#destroy_all
                    products GET    /products(.:format)                                                                      products#index
                     product GET    /products/:id(.:format)                                                                  products#show
                  cart_items GET    /cart_items(.:format)                                                                    cart_items#index
                             POST   /cart_items(.:format)                                                                    cart_items#create
                   cart_item PATCH  /cart_items/:id(.:format)                                                                cart_items#update
                             PUT    /cart_items/:id(.:format)                                                                cart_items#update
                             DELETE /cart_items/:id(.:format)                                                                cart_items#destroy
                  new_orders GET    /orders/new(.:format)                                                                    orders#new
                             POST   /orders(.:format)                                                                        orders#create
                   customers GET    /customers(.:format)                                                                     customers#show
                             PATCH  /customers(.:format)                                                                     customers#update
                             PUT    /customers(.:format)                                                                     customers#update
                  deliveries GET    /deliveries(.:format)                                                                    deliveries#index
                             POST   /deliveries(.:format)                                                                    deliveries#create
               edit_delivery GET    /deliveries/:id/edit(.:format)                                                           deliveries#edit
                    delivery PATCH  /deliveries/:id(.:format)                                                                deliveries#update
                             PUT    /deliveries/:id(.:format)                                                                deliveries#update
                             DELETE /deliveries/:id(.:format)                                                                deliveries#destroy
               order_details GET    /order_details(.:format)                                                                 order_details#index
                order_detail GET    /order_details/:id(.:format)                                                             order_details#show
                  refile_app        /attachments                                                                             #<Refile::App app_file="/home/vagrant/.rbenv/versions/2.5.7/lib/ruby/gems/2.5.0/bundler/gems/refile-46b4178654e6/lib/refile/app.rb">
          rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
   rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
          rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
   update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
        rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

=end
