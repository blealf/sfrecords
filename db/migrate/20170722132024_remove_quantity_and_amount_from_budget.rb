class RemoveQuantityAndAmountFromBudget < ActiveRecord::Migration[5.0]
  def change
    remove_column :budgets, :quantity, :integer
    remove_column :budgets, :amount, :decimal
  end
end
