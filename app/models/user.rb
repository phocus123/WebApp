class User < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, length: {maximum: 15}, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true

	has_secure_password
	has_many :user_courses
	has_many :courses, through: :user_courses

	
end
