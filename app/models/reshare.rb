class Reshare
  include MongoMapper::Document

  timestamps!

  after_create :add_reshare

  belongs_to :reshareable, polymorphic: true
  belongs_to :user

  def add_reshare
    reshareable.add_reshare id
  end
end


