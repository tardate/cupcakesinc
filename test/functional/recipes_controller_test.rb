require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Recipe.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Recipe.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Recipe.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to recipe_url(assigns(:recipe))
  end
  
  def test_edit
    get :edit, :id => Recipe.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Recipe.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Recipe.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Recipe.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Recipe.first
    assert_redirected_to recipe_url(assigns(:recipe))
  end
  
  def test_destroy
    recipe = Recipe.first
    delete :destroy, :id => recipe
    assert_redirected_to recipes_url
    assert !Recipe.exists?(recipe.id)
  end
end
