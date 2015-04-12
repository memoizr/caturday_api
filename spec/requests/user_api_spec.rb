require 'spec_helper'

describe Api::V1::CatPostApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }
  let!(:cat_post_0) { create(:cat_post) }
  let!(:cat_post_1) { create(:cat_post) }

  describe 'GET' do
    before do

      current_user.add_favorite(current_user.id, cat_post_0.id)
      current_user.add_favorite(current_user.id, cat_post_1.id)
    end
    it "returns 200" do
      post "/api/v1/cat_post", {
        "user_id" => current_user.id,
        "caption" => "helloworld",
        "image_url" => "foo.com"
      }.to_json, {
        "Auth-Token" => current_user.authentication_token,
        "CONTENT_TYPE" => "application/json"
      }

      body = JSON.parse(response.body)
      puts body
      expect(response.status).to eq(201)
    end
  end
end

