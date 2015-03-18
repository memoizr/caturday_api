class InappropriateContentReport
  include MongoMapper::Document

  timestamps!

  key :report_type, String
  key :description, String
  key :open, Boolean

  belongs_to :reportable, polymorphic: true
  belongs_to :user
end

