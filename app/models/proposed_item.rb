class ProposedItem < ApplicationRecord
  belongs_to :budget

  before_save { calculate_saving}

	VALID_NUMBER_REGEX = /\d+(([.,])\d+)?/
	validates :cost, presence: true, format: { with: VALID_NUMBER_REGEX }
	#validates :quantity, format: { with: VALID_NUMBER_REGEX }, :if => :quantity

	def calculate_amount
		if self.quantity == nil || self.quantity < 1
	  		self.quantity = 1
		end
		self.amount = self.cost * self.quantity

		return self.amount
	end

  def calculate_spending
  	budget = Budget.find(self.budget_id)
  	spending = budget.spending + calculate_amount
  	budget.update(spending: spending)
  end

  def calculate_saving
  	calculate_spending
  	budget = Budget.find(self.budget_id)
  	saving = budget.income.to_f - budget.spending
  	budget.update(saving: saving) 	
  end
end
