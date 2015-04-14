module Reshareable
  extend ActiveSupport::Concern

  included do
    key :reshare_count, Integer, default: 0
    key :reshare_ids, Array
  end

  def add_reshare(reshare_id)
    increment reshare_count: 1
    push reshare_ids: reshare_id
  end

  def remove_reshare(reshare_id)
    decrement reshare_count: 1
    pop reshare_ids: reshare_id
  end
end
