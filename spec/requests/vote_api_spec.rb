require 'spec_helper'

describe Api::V1::VoteApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }
  let!(:cat_post) { create(:cat_post) }
  let!(:comment) { create(:comment) }

  context 'cat_post vote' do
    describe 'POST' do

      before do
        post "/api/v1/vote", {
          voteable_type: "CatPost",
          voteable_id: cat_post.id,
          positive: true
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "it updates the post" do
        expect(cat_post.vote_count).to eql 0
        expect(cat_post.vote_ids).to eql []

        vote_count = cat_post.reload.vote_count
        vote_ids = cat_post.reload.vote_ids
        body = JSON.parse(response.body)

        expect(vote_count).to eql 1
        expect(vote_ids[0].to_s).to eql body["id"]
      end
    end

    describe 'DELETE' do
      let!(:vote) { create(:vote, voteable_type: "CatPost", voteable_id: cat_post.id, user_id: current_user.id) }

      before do
        delete "/api/v1/vote", {
          voteable_id: cat_post.id
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(200)
      end

      it "it updates the post" do
        expect(Vote.find(vote.id)).to eql nil
      end
    end
  end

  context 'comment vote' do
    describe 'POST' do

      before do
        post "/api/v1/vote", {
          voteable_type: "Comment",
          voteable_id: comment.id,
          positive: true
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "returns the id of the right comment" do
        expect(comment.vote_count).to eql 0
        expect(comment.vote_ids).to eql []

        vote_count = comment.reload.vote_count
        vote_ids = comment.reload.vote_ids
        body = JSON.parse(response.body)

        expect(vote_count).to eql 1
        expect(vote_ids[0].to_s).to eql body["id"]
      end
    end

    describe 'DELETE' do
      let!(:vote) { create(:vote, voteable_type: "Comment", voteable_id: comment.id, user_id: current_user.id) }

      before do
        delete "/api/v1/vote", {
          voteable_id: comment.id
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(200)
      end

      it "it updates the post" do
        expect(Vote.find(vote.id)).to eql nil
        expect(comment.vote_ids).to eql []
        expect(comment.vote_count).to eql 0
      end
    end
  end
end

