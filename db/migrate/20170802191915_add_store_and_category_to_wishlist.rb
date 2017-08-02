class AddStoreAndCategoryToWishlist < ActiveRecord::Migration[5.0]
  def change
    add_column :wishlists, :storename, :string
    add_column :wishlists, :category, :string
  end
end
