require 'spec_helper'

describe Api::V1::CommentApi, :type => :request do
  let!(:user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }
  let!(:cat_post_0) { create(:cat_post) }
  let!(:cat_post_1) { create(:cat_post) }

  describe 'POST' do

    before do
      post "/api/v1/comment", {
        commentable_type: "CatPost",
        commentable_id: cat_post_0.id,
        content: "this is so cool"
      }.to_json, { "Auth-Token" => user.authentication_token, "Content-Type" => "application/json"}
    end

    it "returns 201" do
      expect(response.status).to eq(201)
    end

    it "returns the id of the right post" do
      body = JSON.parse(response.body)
      expect(cat_post_0.reload.comment_count).to eql 1
      expect(body["server_id"]).to eql cat_post_0.id.to_s
    end
  end

  describe 'DELETE' do
    let!(:comment) { create(:comment, commentable_type: "CatPost", content: "foo", commentable_id: cat_post_0.id, user_id: user.id) }
    let!(:old_post) { cat_post_0.reload }

    before do
      delete "/api/v1/comment", {
        commentable_id: cat_post_0.id,
      }.to_json, { "Auth-Token" => user.authentication_token, "Content-Type" => "application/json"}
    end

    it "returns 201" do
      expect(response.status).to eq(200)
    end

    it "decrements the comment count of the commentable" do
      expect(old_post.comment_count).to eql 1
      expect(cat_post_0.reload.comment_count).to eql 0
    end

    it "deletes from the array off commment ids" do
      expect(old_post.comment_ids).to eql [comment.id]
      expect(cat_post_0.reload.comment_ids).to eql []
    end
  end
end

