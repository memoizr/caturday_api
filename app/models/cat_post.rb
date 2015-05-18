class CatPost
  include MongoMapper::Document
  include Voteable
  include Commentable
  include Downloadable
  include Reshareable

  timestamps!

  key :caption, String
  key :image_url, String
  key :category, String
  key :view_count, Integer, default: 0

  many :reshares, as: :reshareable
  many :inappropriate_content_reports, as: :reportable

  belongs_to :user

  validates :user_id, presence: true, on: :create
  validates :image_url, presence: true, on: :create

end
