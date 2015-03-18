require 'spec_helper'

describe Api::V1::VoteApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }
  let!(:cat_post) { create(:cat_post) }
  let!(:comment) { create(:comment) }

  context 'cat_post vote' do
    describe 'POST' do

      before do
        post "/api/v1/vote", {
          user_id: current_user.id,
          voteable_type: "CatPost",
          voteable_id: cat_post.id,
          positive: true
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "returns the id of the right post" do
        body = JSON.parse(response.body)
        expect(body["voteable_id"]).to eql(cat_post.id.to_s)
      end
    end
  end

  context 'cat_post vote' do
    describe 'POST' do

      before do
        post "/api/v1/vote", {
          user_id: current_user.id,
          voteable_type: "Comment",
          voteable_id: comment.id,
          positive: true
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "returns the id of the right comment" do
        body = JSON.parse(response.body)
        expect(body["voteable_id"]).to eql(comment.id.to_s)
      end
    end
  end
end




