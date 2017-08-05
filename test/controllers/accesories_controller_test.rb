require 'test_helper'

class AccesoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accesory = accesories(:one)
  end

  test "should get index" do
    get accesories_url
    assert_response :success
  end

  test "should get new" do
    get new_accesory_url
    assert_response :success
  end

  test "should create accesory" do
    assert_difference('Accesory.count') do
      post accesories_url, params: { accesory: { body: @accesory.body, title: @accesory.title, type: @accesory.type } }
    end

    assert_redirected_to accesory_url(Accesory.last)
  end

  test "should show accesory" do
    get accesory_url(@accesory)
    assert_response :success
  end

  test "should get edit" do
    get edit_accesory_url(@accesory)
    assert_response :success
  end

  test "should update accesory" do
    patch accesory_url(@accesory), params: { accesory: { body: @accesory.body, title: @accesory.title, type: @accesory.type } }
    assert_redirected_to accesory_url(@accesory)
  end

  test "should destroy accesory" do
    assert_difference('Accesory.count', -1) do
      delete accesory_url(@accesory)
    end

    assert_redirected_to accesories_url
  end
end
