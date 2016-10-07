class User < ApplicationRecord
	validates_presence_of :email, :full_name, :location, :password
	validates_confirmation_of :password
	validates_length_of :bio, minimum:1, allow_blanck:false
	validates_uniqueness_of :email
end
