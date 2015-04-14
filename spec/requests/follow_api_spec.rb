require 'spec_helper'

describe Api::V1::FollowApi, :type => :request do
  let!(:follower) { create(:user) }
  let!(:followed) { create(:user) }

  describe 'POST' do
    before do
      post "/api/v1/follow", {
        followable_type: "User",
        followable_id: followed.id
      }.to_json, { "Auth-Token" => follower.authentication_token, "Content-Type" => "application/json"}
    end

    it "returns 201" do
      expect(response.status).to eq(201)
    end

    it "returns the id of the right post" do
      body = JSON.parse(response.body)
      expect(body["followable_id"]).to eql followed.id.to_s
    end

    it "increments the count of followers" do
      expect(followed.reload.follow_count).to eql 1
    end

    it "adds to the follower array" do
      body = JSON.parse(response.body)
      expect(followed.reload.follow_ids[0].to_s).to eql body["id"]
    end

    it "adds to the following array" do
      expect(follower.reload.follows[0].followable_id).to eql followed.id
    end
  end

  describe 'DELETE' do
    let!(:follow) { create(:follow, followable_id: followed.id, user_id: follower.id) }
    let!(:old_followed) { followed.reload }

    before do
      delete "/api/v1/follow", {
        followable_id: followed.id,
      }.to_json, { "Auth-Token" => follower.authentication_token, "Content-Type" => "application/json"}
    end

    it "returns 201" do
      expect(response.status).to eq(200)
    end

    it "decrements the follow count of the followable" do
      expect(old_followed.follow_count).to eql 1
      expect(followed.reload.follow_count).to eql 0
    end
  end
end

