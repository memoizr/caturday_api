class User
  include MongoMapper::Document
  include ActiveModel::SecurePassword
  include Followable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  timestamps!

  key :username, String
  key :email, String
  key :password_digest, String
  key :description, String
  key :first_name, String
  key :last_name, String
  key :image_url, String
  key :cover_image_url, String
  key :account_suspended, String, default: false
  key :downloads, Array
  key :favorites, Array

  many :cat_posts
  many :votes
  many :comments
  many :follows

  validates :password, presence: true, length: {minimum: 6}, on: :create
  validates :username, presence: true, length: {maximum: 20}
  validates :email, presence: true, length: {maximum: 50},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true

  has_secure_password

  # Recoverable
  key :reset_password_token, String
  key :reset_password_sent_at, Time
  key :authentication_token, String

  key :confirmation_token, String
  key :confirmed_at, Time
  key :confirmation_sent_at, Time

  # Trackable
  key :sign_in_count,      :type => Integer, :default => 0
  key :current_sign_in_at, :type => Time
  key :last_sign_in_at,    :type => Time

  def skip_confirmation!
    self.confirmed_at = Time.now
  end

  def add_download(user_id, cat_post_id)
    user = User.find(user_id)
    user.push(downloads: cat_post_id)
  end

  def add_favorite(user_id, cat_post_id)
    user = User.find(user_id)
    user.push(favorites: cat_post_id)
  end

  before_save do
    ensure_authentication_token
    ensure_profile_image
  end

  def ensure_profile_image
    unless image_url
      self.image_url = DefaultImageHelper.default_profile_images.sample
    end
  end

  def log_in(password)
    user = authenticate(password)

    if user
      increment sign_in_count: 1
      set current_sign_in_at: Time.now
      ensure_authentication_token
    end

    user
  end

  def ensure_authentication_token
    if !authentication_token
      self.authentication_token = SecureRandom.uuid.gsub(/\-/,'')
      set authentication_token: authentication_token
    end

    authentication_token
  end

  def log_out
    set authentication_token: nil
    set last_sign_in_at: Time.now
  end
end
