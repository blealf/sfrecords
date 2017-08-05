class CreateAccesories < ActiveRecord::Migration[5.0]
  def change
    create_table :accesories do |t|
      t.string :title
      t.text :body
      t.string :type

      t.timestamps
    end
  end
end
