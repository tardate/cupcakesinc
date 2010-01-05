ActionController::Routing::Routes.draw do |map|

  map.resources :order_items

  map.resources :orders

  map.resources :products

  map.resources :recipes

  map.resources :customers

  map.root :products

end
