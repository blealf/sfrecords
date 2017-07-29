class Budget < ApplicationRecord

  belongs_to :user
  has_many :proposed_items, dependent: :destroy
  has_many :proposed_incomes, dependent: :destroy

  #before_save { calculate_spending }

  # def calculate_spending
  # 	self.spending = self.proposed_items{ |s| s + self.spending}
  # end

  # def calculate_income

  # end

  # def calculate_saving

  # end
end
