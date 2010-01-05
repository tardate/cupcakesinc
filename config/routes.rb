ActionController::Routing::Routes.draw do |map|

  map.resources :reports
  
  map.resources :orders do |order|
	order.resources :items, :controller => 'order_items'
  end

  map.resources :products

  map.resources :recipes

  map.resources :customers

  map.root :products

end
