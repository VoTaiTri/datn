class Lecturer < ActiveRecord::Base
  attr_accessor :remember_token

  belongs_to :department

  has_many :teachings, dependent: :destroy
  has_many :subjects, through: :teachings

  before_save :downcase_email

	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password        
  validates :password, length: {minimum: 6}
  validates :avatar, length: {maximum: 255}

  accept_nested_attributes_for :teachings, allow_destroy: true

  # Returns the hash digest of the given string.
  def Lecturer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Lecturer.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = Lecturer.new_token
    update_attribute(:remember_digest, Lecturer.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  	def downcase_email
      self.email = email.downcase
    end
end