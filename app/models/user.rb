class User < ApplicationRecord

	#attr_accessor :password

	has_many :user_items
	has_many :incomes
	has_many :budgets
	has_many :wishlists

	before_save { self.email = email.downcase }

	validates :firstname, :lastname, :date_of_birth, presence: true
	validates :username, presence: true, uniqueness: true, length: { minimum: 4 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
				format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }, :if => :password

	
	has_secure_password

	def self.unit
		return ["CAD", "USD", "EUR", "GBP", "AUD", "NZD", "NGN", "YEN", "BGN", "CHF"]
	end


	# def self.digest(string)
	# 	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
	# 	BCrypt::Password.create(string, cost: cost)
	# end

end


