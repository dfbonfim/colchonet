class User < ApplicationRecord
	validates_presence_of :email, :full_name, :location
	validates_length_of :bio, minimum:1, allow_blanck:false
	validates_uniqueness_of :email

	has_secure_password

  before_create :generate_token

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ""

    save!
  end

  def confirmed?
    confirmed_at.present?
  end
end
