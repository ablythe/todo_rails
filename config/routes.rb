Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#home'
  get "lists/:id" => 'list#show', as: 'list'
  post "lists" => 'list#create', as: 'lists' 
  get "lists" => 'list#index'

 get "lists/:list_id/new_item" => 'item#new', as: 'new_item'
 post 'lists/:list_id/items' => 'item#create', as: "items"
 get "items/:id" => 'item#show', as: "item"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  
end
