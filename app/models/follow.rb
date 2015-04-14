class Follow
  include MongoMapper::Document

  timestamps!

  after_create :add_follow
  before_destroy :remove_follow

  belongs_to :followable, polymorphic: true
  belongs_to :user

  def add_follow
    followable.add_follow id
  end

  def remove_follow
    followable.remove_follow id
  end
end

