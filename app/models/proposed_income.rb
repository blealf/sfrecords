class ProposedIncome < ApplicationRecord
  belongs_to :budget

  before_save { calculate_saving }
  VALID_NUMBER_REGEX = /\d+(([.,])\d+)?/
	validates :amount, presence: true, format: { with: VALID_NUMBER_REGEX }

  def calculate_income
  	budget = Budget.find(self.budget_id)
  	income = budget.income.to_f + self.amount
  	budget.update(income: income)
  end

  def calculate_saving
  	calculate_income
  	budget = Budget.find(self.budget_id)
  	saving = budget.income.to_f - budget.spending.to_f
  	budget.update(saving: saving) 	
  end
end
