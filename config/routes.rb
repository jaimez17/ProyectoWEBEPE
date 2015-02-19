Rails.application.routes.draw do

  devise_for :empleados
  resources :knows

  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comentarios

  resources :subcategorias

  resources :categorias
  
  get 'tickets/abiertas' => 'tickets#abiertas'
  post 'tickets/asignar' => 'tickets#asignar'
  get 'tickets/atendidas' => 'tickets#atendidas'
  post 'tickets/atendidas' => 'tickets#atendidas'
  get 'tickets/asignadas' => 'tickets#asignadas'
  post 'tickets/asignadas' => 'tickets#asignadas'
  #get 'tickets/ver' => 'tickets#ver'
  get 'tickets/ver/:id' => 'tickets#ver'
  #post 'tickets/ver' => 'tickets#ver'
  
  resources :tickets

  resources :subcategoria

  resources :categoria
  
  resources :areas

  resources :empresas

  resources :roles
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   #root 'usuarios#login'
  devise_for :usuarios
  devise_scope :usuario do
    authenticated :usuario do
      root :to => 'tickets#index', as: :authenticated_root
    end
    unauthenticated :usuario do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
   resources :usuarios    
   
  resources :empleados

  # Example of regular route:

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
  
  match 'auth/:provider/callback', to: 'sessions#create', :via => [:get, :post]
  match 'auth/failure', to: redirect('/'), :via => [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', :via => [:get, :post]
end
