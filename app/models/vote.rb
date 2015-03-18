class Vote
  include MongoMapper::Document

  timestamps!

  key :positive, Boolean, default: false

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :voteable_type, presence: true, on: :create
  validates :voteable_id, presence: true, on: :create
  validates :user_id, presence: true, on: :create
end

