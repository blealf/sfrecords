class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.references :user, foreign_key: true
      t.string :job
      t.decimal :pay

      t.timestamps
    end
  end
end
