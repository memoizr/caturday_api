module Commentable
  extend ActiveSupport::Concern

  included do
    key :comment_count, Integer, default: 0
    key :comment_ids, Array
  end

  def add_comment(comment_id)
    increment comment_count: 1
    push comment_ids: comment_id
  end

  def remove_comment(comment_id)
    decrement comment_count: 1
    pop comment_ids: comment_id
  end
end
