class User
  include MongoMapper::Document
  include ActiveModel::SecurePassword

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, #here
    :token_authenticatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  key :username, String
  key :email, String
  key :password_digest, String
  key :encrypted_password, String, :default => ""
  key :description, String
  key :first_name, String
  key :last_name, String

  many :cat_posts

  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :username, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 40},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  before_save :ensure_authentication_token

  ## Recoverable
  key :reset_password_token, String
  key :reset_password_sent_at, Time
  key :authentication_token, String

  ## Rememberable
  key :remember_created_at, :type => Time

  ## Trackable
  key :sign_in_count,      :type => Integer, :default => 0
  key :current_sign_in_at, :type => Time
  key :last_sign_in_at,    :type => Time
  key :current_sign_in_ip, :type => String
  key :last_sign_in_ip,    :type => String
end
