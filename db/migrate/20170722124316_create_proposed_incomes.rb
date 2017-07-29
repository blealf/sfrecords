class CreateProposedIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :proposed_incomes do |t|
      t.string :source
      t.string :comment
      t.decimal :amount
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
