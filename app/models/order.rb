class Order < ActiveRecord::Base
  attr_accessible :customer_id, :order_date
  has_many :order_items
  belongs_to :customer
  
end
