class Wishlist < ApplicationRecord
	belongs_to :user
	before_save { calculate_amount }

	validates :itemname, presence: true

	VALID_NUMBER_REGEX = /\d+(([.,])\d+)?/
	validates :itemcost, presence: true, format: { with: VALID_NUMBER_REGEX }
	#validates :quantity, format: { with: VALID_NUMBER_REGEX }, :if => :quantity
	
	def calculate_amount
		if self.quantity == nil || self.quantity < 1
      		self.quantity = 1
    	end
		self.amount = self.itemcost * self.quantity
	end

end
