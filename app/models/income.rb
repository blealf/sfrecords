class Income < ApplicationRecord
  belongs_to :user

	def self.totalIncome(incomes)
		sum = 0.00
		incomes.map{|income| sum += income.pay.to_f}
		return sum
	end
end
