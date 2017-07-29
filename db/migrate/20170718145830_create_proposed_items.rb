class CreateProposedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :proposed_items do |t|
      t.string :name
      t.string :comment
      t.decimal :cost
      t.integer :quantity
      t.decimal :amount
      t.string :category
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
