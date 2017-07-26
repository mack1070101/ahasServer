# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  has_secure_password
  # Ensure that the users email is unique by making all emails lowercase
  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

  validates :password, presence: true, length: { minimum: 7 }, allow_nil: true

  # digest user password with specific Bcrypt parameters
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.from_token_payload(payload)
    # Returns a valid user, `nil` or raise
    # e.g.
    self.find payload["sub"]
  end

  def to_token_payload
    { sub: id, role: type }
  end
end
