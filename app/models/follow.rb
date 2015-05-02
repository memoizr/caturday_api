class Follow
  include MongoMapper::Document

  timestamps!

  after_create :add_follow
  before_destroy :remove_follow

  belongs_to :followable, polymorphic: true
  belongs_to :user

  validates :followable_type, presence: true, on: :create
  validates :followable_id, presence: true, on: :create
  validates :user_id, presence: true, on: :create

  def add_follow
    followable.add_follow id
  end

  def remove_follow
    followable.remove_follow id
  end
end

