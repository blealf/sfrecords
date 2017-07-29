class UserItem < ApplicationRecord

	belongs_to :user
	before_save { calculate_amount }

	validates :itemname, :category, presence: true

	VALID_NUMBER_REGEX = /\d+(([.,])\d+)?/
	validates :itemcost, presence: true, format: { with: VALID_NUMBER_REGEX }



	def self.category
		return ["Clothing", "Educational Materials", "Food", "Gadgets", "Luxury", "Others", "Rent", "Tuition"]
	end


	def calculate_amount
		if self.quantity == nil || self.quantity < 1
      		self.quantity = 1
    	end
		self.amount = self.itemcost * self.quantity
	end

	def self.totalCost(items)
		sum = 0.00
		items.map{|user_item| sum += user_item.amount.to_f}
		return sum
	end

	def self.totalQuantity(items)
		quantity = 0
		items.map{|user_item| quantity += user_item.quantity.to_i}
		return quantity
	end

  	# def save_to_usd(value)
  	# 	user_unit = User.find(self.user_id).unit
  	# 	return Concurrency.convert(value, user_unit, "USD")
  	# end

end
