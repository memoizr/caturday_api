require 'spec_helper'

describe Api::V1::CommentApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }

  #describe 'POST #create' do
    #it "returns 200" do
      #post "/api/v1/cat_post.json", {
        #"user_id" => current_user.id,
        #"caption" => "helloworld",
        #"api_key" => current_user.authentication_token,
        #"image_url" => "foo.com"
        #}.to_json, {
          #"CONTENT_TYPE" => "application/json"
        #}

      #expect(response.status).to eq(201)
    #end
  #end

  describe 'GET #show' do
    let!(:comment) { create(:comment, user: current_user) }

    before do
      get "/api/v1/comment.json?api_key=#{current_user.authentication_token}"
    end

    it "returns 200" do

      puts response.body
      expect(response.status).to eq(200)
    end
  end

  #describe 'GET post' do
    #let!(:cat_post_0) { create(:cat_post) }
    #let!(:cat_post_1) { create(:cat_post) }

    #before do
      #get "/api/v1/cat_post/#{cat_post_0.id}.json?api_key=#{current_user.authentication_token}"
    #end

    #it "returns 200" do
      #expect(response.status).to eq(200)
    #end

    #it "returns the right post" do
      #body = JSON.parse(response.body)
      #expect(body["_id"]).to eql(cat_post_0.id.to_s)
    #end
  #end
end



