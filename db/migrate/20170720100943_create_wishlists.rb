class CreateWishlists < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlists do |t|
      t.string :itemname
      t.string :comment
      t.decimal :itemcost
      t.integer :quantity
      t.decimal :amount

      t.timestamps
    end
  end
end
