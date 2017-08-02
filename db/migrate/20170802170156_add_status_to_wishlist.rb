class AddStatusToWishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :status, :boolean
  end
end
