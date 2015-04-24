require 'spec_helper'

describe Entity::CatPostEntity do

  let!(:cat_post) { create(:cat_post) }

  let!(:comment) { create(:comment,
                          content: "Hello there",
                          commentable_type: "CatPost",
                          commentable_id: cat_post.id) }

  let!(:vote_0) { create(:vote,
                       voteable_id: comment.id,
                       voteable_type: "Comment") }

  let!(:vote_1) { create(:vote,
                         voteable_id: comment.id,
                         voteable_type: "Comment"
                       ) }

  let!(:vote_3) { create(:vote,
                       voteable_id: cat_post.id,
                       voteable_type: "CatPost"
                        ) }

  let!(:vote_4) { create(:vote,
                         voteable_id: cat_post.id,
                         voteable_type: "CatPost"
                       ) }

  let!(:vote_5) { create(:vote,
                       voteable_id: cat_post.id,
                       voteable_type: "CatPost"
                        ) }

  it "should create json" do
    json = Entity::CatPostEntity.new(cat_post.reload).as_json

    expect(json[:server_id]).to eq(cat_post.id)
    expect(json[:vote_count]).to eq 3
    expect(json[:comments][0][:vote_count]).to eq 2
  end
end

