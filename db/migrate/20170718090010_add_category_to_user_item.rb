class AddCategoryToUserItem < ActiveRecord::Migration[5.0]
  def change
    add_column :user_items, :category, :string
  end
end
