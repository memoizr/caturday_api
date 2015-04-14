class Comment
  include MongoMapper::Document
  include Voteable

  timestamps!

  after_create :add_comment
  before_destroy :remove_comment

  key :vote_count, Integer, default: 0
  key :vote_ids, Array

  key :content, String

  many :inappropriate_content_reports, as: :reportable

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, on: :create
  validates :commentable_type, presence: true, on: :create
  validates :commentable_id, presence: true, on: :create
  validates :user_id, presence: true, on: :create

  def add_comment
    commentable.add_comment id
  end

  def remove_comment
    commentable.remove_comment id
  end
end
