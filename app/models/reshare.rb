class Reshare
  include MongoMapper::Document

  timestamps!

  belongs_to :reshareable, polymorphic: true
  belongs_to :user
end


