class Order < ActiveRecord::Base
  #attr_accessible :customer_id, :order_date, :customer
  belongs_to :customer
  has_many :order_items

end
