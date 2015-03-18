require 'spec_helper'

describe Entity::CommentEntity do
  let!(:cat_post) { create(:cat_post) }
  let!(:comment) { create(:comment,
                          content: "Hello there",
                          commentable_type: "CatPost",
                          commentable_id: cat_post.id) }

  let!(:vote_0) { create(:vote,
                       :incorrect,
                       voteable_id: comment.id,
                       voteable_type: "Comment") }

  let!(:vote_1) { create(:vote,
                         :correct,
                         voteable_id: comment.id,
                         voteable_type: "Comment"
                       ) }

  let!(:vote_2) { create(:vote,
                       :incorrect,
                       voteable_id: comment.id,
                       voteable_type: "Comment") }

  it "should create json" do
    json = Entity::CommentEntity.new(comment).as_json

    expect(json[:id]).to eq(comment.id)
    expect(json[:positive_votes_count]).to eq(1)
    expect(json[:negative_votes_count]).to eq(2)
    expect(json[:total_votes_count]).to eq(3)
  end
end
