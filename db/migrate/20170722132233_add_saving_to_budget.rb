class AddSavingToBudget < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :saving, :decimal
  end
end
