json.extract! wishlist, :id, :itemname, :comment, :itemcost, :quantity, :amount, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
