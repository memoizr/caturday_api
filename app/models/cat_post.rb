class CatPost
  include MongoMapper::Document

  key :caption, String
  key :image_url, String
  key :likes, Integer, default: 0

  belongs_to :user
  many :comments

  #validates :user, presence: true, on: :create
  validates :caption, presence: true, on: :create
  validates :image_url, presence: true, on: :create

  def add_like
    self.likes += 1
  end
end
