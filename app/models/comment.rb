class Comment
  include MongoMapper::Document

  timestamps!

  key :content, String
  key :reply_to_user_ids, Array

  many :votes, as: :voteable
  many :inappropriate_content_reports, as: :reportable

  ensure_index :user_id

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, on: :create
  validates :commentable_type, presence: true, on: :create
  validates :commentable_id, presence: true, on: :create
  validates :user_id, presence: true, on: :create
end
