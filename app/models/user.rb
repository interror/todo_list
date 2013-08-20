class User < ActiveRecord::Base

	has_many :projects, dependent: :destroy

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, on: :create
	validates :password, length: { minimum: 6 }
	validates_presence_of :email
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password 
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end
