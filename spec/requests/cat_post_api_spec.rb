require 'spec_helper'

describe Api::V1::CatPostApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }

  describe 'POST #create' do
    it "returns 200" do
      post "/api/v1/cat_post", {
        "user_id" => current_user.id,
        "caption" => "helloworld",
        "image_url" => "foo.com"
        }.to_json, {
          "Auth-Token" => current_user.authentication_token,
          "CONTENT_TYPE" => "application/json"
        }

      expect(response.status).to eq(201)
    end
  end

  describe 'PUT #update/download'do
    let!(:cat_post) { create(:cat_post,
                             user_id: current_user.id,
                            caption: "hey",
                            image_url: "foo.com/foo.png") }

    before do
      put "/api/v1/cat_post/#{cat_post.id}/download", {
        "user_id" => current_user.id,
        }.to_json, {
          "Auth-Token" => current_user.authentication_token,
          "CONTENT_TYPE" => "application/json"
        }
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "increments the download count" do
      body = JSON.parse(response.body)
      expect(body["download_count"]).to eq(1)
    end
  end

  describe 'PUT #update/favorite'do
    let!(:cat_post) { create(:cat_post,
                             user_id: current_user.id,
                            caption: "hey",
                            image_url: "foo.com/foo.png") }

    before do
      put "/api/v1/cat_post/#{cat_post.id}/favorite", {
        "user_id" => current_user.id,
        }.to_json, {
          "Auth-Token" => current_user.authentication_token,
          "CONTENT_TYPE" => "application/json"
        }
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "increments the download count" do
      body = JSON.parse(response.body)
      expect(body["favorite_count"]).to eq(1)
    end
  end

  describe 'GET #show' do
    let!(:cat_post_0) { create(:cat_post) }

    before do
      get "/api/v1/cat_post"
    end

    it "returns 200" do

      expect(response.status).to eq(200)
    end
  end

  describe 'GET post' do
    let!(:cat_post_0) { create(:cat_post) }
    let!(:cat_post_1) { create(:cat_post) }

    before do
      get "/api/v1/cat_post/#{cat_post_0.id}"
    end

    it "returns 200" do
      expect(response.status).to eq(200)
    end

    it "returns the right post" do
      body = JSON.parse(response.body)
      expect(body["id"]).to eql(cat_post_0.id.to_s)
    end
  end
end


