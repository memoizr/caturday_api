class CatPost
  include MongoMapper::Document

  timestamps!

  key :caption, String
  key :image_url, String
  key :category, String
  key :view_count, Integer
  key :download_count, Integer

  many :comments, as: :commentable
  many :reshares, as: :reshareable
  many :votes, as: :voteable
  many :inappropriate_content_reports, as: :reportable

  belongs_to :user

  #validates :user_id, presence: true, on: :create
  validates :caption, presence: true, on: :create
  validates :image_url, presence: true, on: :create
end
