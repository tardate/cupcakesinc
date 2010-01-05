require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderItem.new.valid?
  end
end
