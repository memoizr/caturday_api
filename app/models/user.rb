class User
  include MongoMapper::Document
  include ActiveModel::SecurePassword

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :token_authenticatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  timestamps!

  key :username, String
  key :email, String
  key :password_digest, String
  key :encrypted_password, String, :default => ""
  key :description, String
  key :first_name, String
  key :last_name, String
  key :image_url, String
  key :account_suspended, String, default: false

  many :cat_posts
  many :votes
  many :comments

  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :username, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 40},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  before_save :ensure_authentication_token

  ## Recoverable
  key :reset_password_token, String
  key :reset_password_sent_at, Time
  key :authentication_token, String

  key :confirmation_token, String
  key :confirmed_at, Time
  key :confirmation_sent_at, Time

  ## Rememberable
  key :remember_created_at, :type => Time

  ## Trackable
  key :sign_in_count,      :type => Integer, :default => 0
  key :current_sign_in_at, :type => Time
  key :last_sign_in_at,    :type => Time
  key :current_sign_in_ip, :type => String
  key :last_sign_in_ip,    :type => String

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
