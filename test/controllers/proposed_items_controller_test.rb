require 'test_helper'

class ProposedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposed_item = proposed_items(:one)
  end

  test "should get index" do
    get proposed_items_url
    assert_response :success
  end

  test "should get new" do
    get new_proposed_item_url
    assert_response :success
  end

  test "should create proposed_item" do
    assert_difference('ProposedItem.count') do
      post proposed_items_url, params: { proposed_item: { amount: @proposed_item.amount, budget_id: @proposed_item.budget_id, category: @proposed_item.category, comment: @proposed_item.comment, cost: @proposed_item.cost, name: @proposed_item.name, quantity: @proposed_item.quantity } }
    end

    assert_redirected_to proposed_item_url(ProposedItem.last)
  end

  test "should show proposed_item" do
    get proposed_item_url(@proposed_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposed_item_url(@proposed_item)
    assert_response :success
  end

  test "should update proposed_item" do
    patch proposed_item_url(@proposed_item), params: { proposed_item: { amount: @proposed_item.amount, budget_id: @proposed_item.budget_id, category: @proposed_item.category, comment: @proposed_item.comment, cost: @proposed_item.cost, name: @proposed_item.name, quantity: @proposed_item.quantity } }
    assert_redirected_to proposed_item_url(@proposed_item)
  end

  test "should destroy proposed_item" do
    assert_difference('ProposedItem.count', -1) do
      delete proposed_item_url(@proposed_item)
    end

    assert_redirected_to proposed_items_url
  end
end
