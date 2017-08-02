class User < ApplicationRecord

	
	# before_create { generate_token(:auth_token) }

	has_many :user_items, dependent: :destroy
	has_many :incomes, dependent: :destroy
	has_many :budgets, dependent: :destroy
	has_many :wishlists, dependent: :destroy

	attr_accessor :remember_token

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
	 
  	# Returns the hash digest of the given string.
  	def User.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

  	# Returns a random token.
  	def User.new_token
    	SecureRandom.urlsafe_base64
  	end


  	# Remembers a user in the database for use in persistent sessions.
  	def remember
    	self.remember_token = User.new_token
    	update_attribute(:remember_digest, User.digest(remember_token))
  	end

  	# Returns true if the given token matches the digest.
  	def authenticated?(remember_token)
  		return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end


	  # Forgets a user.
	  def forget
	    update_attribute(:remember_digest, nil)
	  end
end


