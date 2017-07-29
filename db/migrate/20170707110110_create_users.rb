class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :othernames
      t.string :occupation
      t.date :date_of_birth
      t.string :username

      t.timestamps
    end
  end
end
