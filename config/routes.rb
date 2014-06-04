RorlaApi::Application.routes.draw do

  resources :tasks, only: [ :index, :show, :create, :update, :destroy ]
  scope :api do
    devise_for :users,
               :path_names => {
                 sign_in: 'login',
                 sign_out: 'logout'
               },
               :controllers => { :sessions => "users/sessions",
                                 :registrations => "users/registrations",
                                 :confirmations => "users/confirmations" }
    resources :users, except: [ :new, :edit ]

    resources :questions, only: [ :index, :show, :create, :update, :destroy ] do
      resources :answers, only: [ :index, :show, :create, :update, :destroy ]
    end


  concern :commentable do
    resources :comments, only: [ :index, :show, :create, :update, :destroy ]
  end

  resources :posts, only: [ :index, :show, :create, :update, :destroy ], concerns: :commentable
  match 'posts' => 'posts#options', via: :options

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  end
end
