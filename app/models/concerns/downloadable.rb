module Downloadable
  extend ActiveSupport::Concern

  included do
    key :download_count, Integer, default: 0
    key :download_ids, Array
  end

  def add_download(download_id)
    self.increment download_count: 1
    self.push download_ids: download_id
  end
end
