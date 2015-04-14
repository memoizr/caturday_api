class Vote
  include MongoMapper::Document

  timestamps!

  key :positive, Boolean, default: false

  after_create :add_vote
  after_destroy :remove_vote

  belongs_to :voteable, polymorphic: true
  belongs_to :user

  validates :voteable_type, presence: true, on: :create
  validates :voteable_id, presence: true, on: :create
  validates :user_id, presence: true, on: :create

  def add_vote
    voteable.add_vote id
  end

  def remove_vote
    voteable.remove_vote id
  end
end

