Rails.application.routes.draw do
  devise_for :admins
  #論理削除のため、コード追加
  devise_for :customers, :controllers => { :registrations => 'customers/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #管理者側
  namespace :admins do
  	root 'homes#top'
  	resources :products, except: [:destroy]
  	resources :genres, only: [:index, :edit, :create, :update]
  	resources :customers, only: [:index, :show, :edit, :update]
  	resources :order_details , only: [:index, :show]
  end
  #顧客側
  root 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'orders' => 'orders#top', as: 'orders'
  get 'customers/resign_page' => 'customers#resign_page', as: 'resign_pgae'
  patch 'customers/resign' => 'customers#resign', as: 'resign'

  resources :products, only: [:index, :show]
  resources :cart_items, except: [:show, :edit, :new]
  resource :orders, only: [:new, :create] 
  resource :customers, only: [:show, :edit, :update] 
  resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  resources :order_details, only: [:index, :show]
end

=begin
     Prefix Verb   URI Pattern                                                                              Controller#Action
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
cancel_customer_registration GET    /customers/cancel(.:format)                                                              customers/registrations#cancel
   new_customer_registration GET    /customers/sign_up(.:format)                                                             customers/registrations#new
  edit_customer_registration GET    /customers/edit(.:format)                                                                customers/registrations#edit
       customer_registration PATCH  /customers(.:format)                                                                     customers/registrations#update
                             PUT    /customers(.:format)                                                                     customers/registrations#update
                             DELETE /customers(.:format)                                                                     customers/registrations#destroy
                             POST   /customers(.:format)                                                                     customers/registrations#create
                  admin_root GET    /admin(.:format)                                                                         admin/homes#top
              admin_products GET    /admin/products(.:format)                                                                admin/products#index
                             POST   /admin/products(.:format)                                                                admin/products#create
           new_admin_product GET    /admin/products/new(.:format)                                                            admin/products#new
          edit_admin_product GET    /admin/products/:id/edit(.:format)                                                       admin/products#edit
               admin_product GET    /admin/products/:id(.:format)                                                            admin/products#show
                             PATCH  /admin/products/:id(.:format)                                                            admin/products#update
                             PUT    /admin/products/:id(.:format)                                                            admin/products#update
                admin_genres GET    /admin/genres(.:format)                                                                  admin/genres#index
                             POST   /admin/genres(.:format)                                                                  admin/genres#create
            edit_admin_genre GET    /admin/genres/:id/edit(.:format)                                                         admin/genres#edit
                 admin_genre PATCH  /admin/genres/:id(.:format)                                                              admin/genres#update
                             PUT    /admin/genres/:id(.:format)                                                              admin/genres#update
             admin_customers GET    /admin/customers(.:format)                                                               admin/customers#index
         edit_admin_customer GET    /admin/customers/:id/edit(.:format)                                                      admin/customers#edit
              admin_customer GET    /admin/customers/:id(.:format)                                                           admin/customers#show
                             PATCH  /admin/customers/:id(.:format)                                                           admin/customers#update
                             PUT    /admin/customers/:id(.:format)                                                           admin/customers#update
         admin_order_details GET    /admin/order_details(.:format)                                                           admin/order_details#index
          admin_order_detail GET    /admin/order_details/:id(.:format)                                                       admin/order_details#show
                        root GET    /                                                                                        homes#top
                       about GET    /homes/about(.:format)                                                                   homes#about
                      orders GET    /orders(.:format)                                                                        orders#top
                 resign_pgae GET    /customers/resign_page(.:format)                                                         customers#resign_page
                      resign PATCH  /customers/resign(.:format)                                                              customers#resign
                    products GET    /products(.:format)                                                                      products#index
                     product GET    /products/:id(.:format)                                                                  products#show
                  cart_items GET    /cart_items(.:format)                                                                    cart_items#index
                             POST   /cart_items(.:format)                                                                    cart_items#create
                   cart_item PATCH  /cart_items/:id(.:format)                                                                cart_items#update
                             PUT    /cart_items/:id(.:format)                                                                cart_items#update
                             DELETE /cart_items/:id(.:format)                                                                cart_items#destroy
                  new_orders GET    /orders/new(.:format)                                                                    orders#new
                             POST   /orders(.:format)                                                                        orders#create
              edit_customers GET    /customers/edit(.:format)                                                                customers#edit
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
          rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
   rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
          rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
   update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
        rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

=end
