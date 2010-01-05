require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => OrderItem.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    OrderItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    OrderItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_item_url(assigns(:order_item))
  end
  
  def test_edit
    get :edit, :id => OrderItem.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    OrderItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderItem.first
    assert_template 'edit'
  end
  
  def test_update_valid
    OrderItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderItem.first
    assert_redirected_to order_item_url(assigns(:order_item))
  end
  
  def test_destroy
    order_item = OrderItem.first
    delete :destroy, :id => order_item
    assert_redirected_to order_items_url
    assert !OrderItem.exists?(order_item.id)
  end
end
