require 'test_helper'

class ProposedIncomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @proposed_income = proposed_incomes(:one)
  end

  test "should get index" do
    get proposed_incomes_url
    assert_response :success
  end

  test "should get new" do
    get new_proposed_income_url
    assert_response :success
  end

  test "should create proposed_income" do
    assert_difference('ProposedIncome.count') do
      post proposed_incomes_url, params: { proposed_income: { amount: @proposed_income.amount, budget_id: @proposed_income.budget_id, comment: @proposed_income.comment, source: @proposed_income.source } }
    end

    assert_redirected_to proposed_income_url(ProposedIncome.last)
  end

  test "should show proposed_income" do
    get proposed_income_url(@proposed_income)
    assert_response :success
  end

  test "should get edit" do
    get edit_proposed_income_url(@proposed_income)
    assert_response :success
  end

  test "should update proposed_income" do
    patch proposed_income_url(@proposed_income), params: { proposed_income: { amount: @proposed_income.amount, budget_id: @proposed_income.budget_id, comment: @proposed_income.comment, source: @proposed_income.source } }
    assert_redirected_to proposed_income_url(@proposed_income)
  end

  test "should destroy proposed_income" do
    assert_difference('ProposedIncome.count', -1) do
      delete proposed_income_url(@proposed_income)
    end

    assert_redirected_to proposed_incomes_url
  end
end
