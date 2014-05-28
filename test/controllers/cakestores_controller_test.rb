require 'test_helper'

class CakestoresControllerTest < ActionController::TestCase
  setup do
    @cakestore = cakestores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cakestores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cakestore" do
    assert_difference('Cakestore.count') do
      post :create, cakestore: { cake_name: @cakestore.cake_name, cake_weight: @cakestore.cake_weight, description: @cakestore.description, occasion: @cakestore.occasion, price: @cakestore.price, quantity: @cakestore.quantity }
    end

    assert_redirected_to cakestore_path(assigns(:cakestore))
  end

  test "should show cakestore" do
    get :show, id: @cakestore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cakestore
    assert_response :success
  end

  test "should update cakestore" do
    patch :update, id: @cakestore, cakestore: { cake_name: @cakestore.cake_name, cake_weight: @cakestore.cake_weight, description: @cakestore.description, occasion: @cakestore.occasion, price: @cakestore.price, quantity: @cakestore.quantity }
    assert_redirected_to cakestore_path(assigns(:cakestore))
  end

  test "should destroy cakestore" do
    assert_difference('Cakestore.count', -1) do
      delete :destroy, id: @cakestore
    end

    assert_redirected_to cakestores_path
  end
end
