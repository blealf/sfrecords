class AddUserReferenceToUserItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_items, :user, foreign_key: true
  end
end
