class CreateUserItems < ActiveRecord::Migration[5.0]
  def change
    create_table :user_items do |t|
      t.string :itemname
      t.string :storename
      t.string :shortdescription
      t.integer :quantity
      t.decimal :itemcost
      t.decimal :amount

      t.timestamps
    end
  end
end
