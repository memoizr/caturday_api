module Commentable
  extend ActiveSupport::Concern

  included do
    key :comment_count, Integer, default: 0
    key :comment_ids, Array
  end

  def add_comment(comment_id)
    increment comment_count: 1
    push comment_ids: comment_id
    notify_of_new_comment(comment_id)
  end

  def remove_comment(comment_id)
    decrement comment_count: 1
    pop comment_ids: comment_id
  end

  def notify_of_new_comment(comment_id)
    comment = Comment.find(comment_id)
    commenter = User.find(comment.user.id)
    data = {
      message: "#{commenter.username} commented: #{comment.content}",
      post_id: comment.commentable_id,
      type: "post_commented"
    }
    GcmSender.send_to_ids([self.user.gcm_registration], data, "post_commented")
  end
end
