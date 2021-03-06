class User < ApplicationRecord
  has_many :slotuserrecords
has_many :slots ,through: :slotuserrecords
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }
  APPROVED_DOMAINS = ["commutatus.com"]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
 validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


validates :email, presence: true, if: :domain_check

def domain_check
  unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
    errors.add(:email, "is not from a valid domain")
  end
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
  

  # Returns true if the given token matches the digest.
   def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.


 def activate
    update_columns(activated: true, activated_at: true)
  end


  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
private
def downcase_email
      self.email = email.downcase
    end
def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
