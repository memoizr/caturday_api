module Voteable
  extend ActiveSupport::Concern

  included do
    key :vote_count, Integer, default: 0
    key :vote_ids, Array
  end

  def add_vote(vote_id)
    self.increment vote_count: 1
    self.push vote_ids: vote_id
    notify_of_new_vote(vote_id)
  end

  def remove_vote(vote_id)
    self.decrement vote_count: 1
    self.pop vote_ids: vote_id
  end

  def notify_of_new_vote(vote_id)
    vote = Vote.find(vote_id)
    voter = User.find(vote.user.id)
    data = {
      message: "#{voter.username} +1'd your post!",
      post_id: vote.voteable_id,
      type: "post_voted"
    }
    GcmSender.send_to_ids([self.user.gcm_registration], data, "post_voted")
  end

  def destroy
    Vote.find(self.vote_ids).each do |vote|
      vote.destroy
    end
    super
  end
end
