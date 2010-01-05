require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Customer.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Customer.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Customer.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to customer_url(assigns(:customer))
  end
  
  def test_edit
    get :edit, :id => Customer.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Customer.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Customer.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Customer.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Customer.first
    assert_redirected_to customer_url(assigns(:customer))
  end
  
  def test_destroy
    customer = Customer.first
    delete :destroy, :id => customer
    assert_redirected_to customers_url
    assert !Customer.exists?(customer.id)
  end
end
