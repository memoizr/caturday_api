require 'spec_helper'

describe Api::V1::CommentApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }
  let!(:cat_post_0) { create(:cat_post) }
  let!(:cat_post_1) { create(:cat_post) }

  describe 'POST' do

    before do
      post "/api/v1/comment", {
        user_id: current_user.id,
        commentable_type: "CatPost",
        commentable_id: cat_post_0.id,
        content: "this is so cool",
        reply_to_user_ids: []
      }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
    end

    it "returns 201" do
      expect(response.status).to eq(201)
    end

    it "returns the id of the right post" do
      expect(body["commentable_id"]).to eql(cat_post_0.id.to_s)
    end
  end
end



