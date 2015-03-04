Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'
  get "lists/:id" => 'list#show', as: 'list'
  post "lists" => 'list#create', as: 'create_list'
  get "lists" => 'list#index', as: 'lists'
  get 'lists/:id/edit' => 'list#edit', as: 'edit_list'
  patch 'lists/:id' => 'list#update'
  delete "lists/:id/delete" => 'list#delete'

 get "lists/:list_id/new_item" => 'item#new', as: 'new_item'
 post 'lists/:list_id/items' => 'item#create', as: 'item_create'
 get "items/:id" => 'item#show', as: "item"
 get "items/:id/edit" => 'item#edit', as: 'edit_item'
 patch "items/:id" => 'item#update', as: 'update_item'
 get 'lists/:list_id/items' => 'item#list', as: 'list_items'
 get 'items' => 'item#index', as: "items" 
 delete 'items/:id' => 'item#delete'

 resources :users

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  
end
