module Followable
  extend ActiveSupport::Concern

  included do
    key :follow_count, Integer, default: 0
    key :follow_ids, Array
  end

  def add_follow(follow_id)
    increment follow_count: 1
    push follow_ids: follow_id
  end

  def remove_follow(follow_id)
    decrement follow_count: 1
    pop follow_ids: follow_id
  end
end
