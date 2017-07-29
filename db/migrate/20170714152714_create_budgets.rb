class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.references :user, foreign_key: true
      t.string  :title
      t.text    :description
      t.decimal :cost
      t.integer :quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
