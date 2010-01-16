require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  def test_should_be_valid
    assert Order.new.valid?
  end
  
  def test_can_access_customer_details
	order = orders(:one)
	assert  order.valid?
	assert  ! order.customer_id.nil?
	cust = Customer.find(order.customer_id)
	assert cust.valid?
	assert  order.customer.respond_to?( :name )
	assert  !order.customer.name.blank?
  end
  
  def test_can_access_customer_details_while_iterating
	
	Order.all.each do |order|
		assert  order.valid?
		assert  ! order.customer_id.nil?
		cust = Customer.find(order.customer_id)
		assert cust.valid?
		assert  order.customer.respond_to?( :name )
		assert  !order.customer.name.blank?
	end
  end
  
end
