class AddSpendingAndIncomeToBudget < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :spending, :decimal
    add_column :budgets, :income, :decimal
  end
end
