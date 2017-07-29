json.extract! user_item, :id, :itemname, :storename, :shortdescription, :quantity, :itemcost, :amount, :created_at, :updated_at
json.url user_item_url(user_item, format: :json)
