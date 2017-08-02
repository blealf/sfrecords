class User < ApplicationRecord

	#attr_accessor :password
	# before_create { generate_token(:auth_token) }

	has_many :user_items, dependent: :destroy
	has_many :incomes, dependent: :destroy
	has_many :budgets, dependent: :destroy
	has_many :wishlists, dependent: :destroy

	before_save { self.email = email.downcase }

	validates :firstname, :lastname, presence: true
	#validates :username, presence: true, uniqueness: true, length: { minimum: 4 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
				format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }, :if => :password

	
	has_secure_password

	def self.unit
		return ["CAD", "USD", "EUR", "GBP", "AUD", "NZD", "NGN", "YEN", "BGN", "CHF"]
	end

	def self.totalSpending(user)
		UserItem.totalCost(UserItem.where(user_id: user).find_each)
	end

	def self.totalIncome(user)
		Income.totalIncome(Income.where(user_id: user).find_each)
	end
	# def self.digest(string)
	# 	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	# 	BCrypt::Password.create(string, cost: cost)
	# end

	# def send_password_reset
	#   generate_token(:password_reset_token)
	#   self.password_reset_sent_at = Time.zone.now
	#   save!
	#   UserMailer.password_reset(self).deliver
	# end

	# def generate_token(column)
	#   begin
	#     self[column] = SecureRandom.urlsafe_base64
	#   end while User.exists?(column => self[column])
	# end

end


