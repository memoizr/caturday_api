require 'spec_helper'

describe Entity::CatPostEntity do
  let!(:cat_post) { create(:cat_post) }
  let!(:comment) { create(:comment,
                          content: "Hello there",
                          commentable_type: "CatPost",
                          commentable_id: cat_post.id) }

  let!(:vote_0) { create(:vote,
                       :correct,
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

  let!(:vote_3) { create(:vote,
                       :incorrect,
                       voteable_id: cat_post.id,
                       voteable_type: "CatPost") }

  let!(:vote_4) { create(:vote,
                         :correct,
                         voteable_id: cat_post.id,
                         voteable_type: "CatPost"
                       ) }

  let!(:vote_5) { create(:vote,
                       :incorrect,
                       voteable_id: cat_post.id,
                       voteable_type: "CatPost") }

  it "should create json" do
    json = Entity::CatPostEntity.new(cat_post).as_json
    puts json

    expect(json[:id]).to eq(cat_post.id)
    expect(json[:positive_votes_count]).to eq(1)
    expect(json[:negative_votes_count]).to eq(2)
    expect(json[:total_votes_count]).to eq(3)
    expect(json[:comments][0][:positive_votes_count]).to eq 2
    expect(json[:comments][0][:negative_votes_count]).to eq 1
  end
end


