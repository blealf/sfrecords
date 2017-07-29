json.extract! budget, :id, :user_id, :item_name, :comment, :cost, :quantity, :amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)
