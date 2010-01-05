class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :qty, :unit_price
  belongs_to :order
  belongs_to :product  
end
