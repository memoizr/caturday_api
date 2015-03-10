class Comment
  include MongoMapper::Document

  key :content, String
  key :likes, Integer

  belongs_to :cat_post
  belongs_to :user

  validates :content, presence: true, on: :create
  validates :cat_post, presence: true, on: :create
  validates :user, presence: true, on: :create

  def add_like
    self.likes += 1
  end
end
