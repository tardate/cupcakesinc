require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Customer.new.valid?
  end
end
