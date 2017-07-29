class AddUserReferenceToUserItem < ActiveRecord::Migration[5.0]
  def change
    add_column :user_items, :user_id, :reference
  end
end
