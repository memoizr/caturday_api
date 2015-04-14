module Voteable
  extend ActiveSupport::Concern

  included do
    key :vote_count, Integer, default: 0
    key :vote_ids, Array
  end

  def add_vote(vote_id)
    self.increment vote_count: 1
    self.push vote_ids: vote_id
  end

  def remove_vote(vote_id)
    self.decrement vote_count: 1
    self.pop vote_ids: vote_id
  end
end
