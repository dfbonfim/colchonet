class User < ApplicationRecord
	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, minimum:1, allow_blanck:false
	validates_uniqueness_of :email

	has_secure_password
end
