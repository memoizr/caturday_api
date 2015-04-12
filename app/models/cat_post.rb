class CatPost
  include MongoMapper::Document

  timestamps!

  key :caption, String
  key :image_url, String
  key :category, String
  key :view_count, Integer, default: 0
  key :download_count, Integer, default: 0
  key :favorite_count, Integer, default: 0

  many :comments, as: :commentable
  many :reshares, as: :reshareable
  many :votes, as: :voteable
  many :inappropriate_content_reports, as: :reportable

  belongs_to :user

  #validates :user_id, presence: true, on: :create
  validates :caption, presence: true, on: :create
  validates :image_url, presence: true, on: :create

  def add_download(cat_post_id)
    cat_post = CatPost.find(cat_post_id)
    cat_post.increment(:download_count => 1)
  end

  def add_favorite(cat_post_id)
    cat_post = CatPost.find(cat_post_id)
    cat_post.increment favorite_count: 1
  end
end
