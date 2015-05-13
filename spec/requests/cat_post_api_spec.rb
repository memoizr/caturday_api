require 'spec_helper'

describe Api::V1::CatPostApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }

  describe 'POST #create' do
    #context "with image upload" do
      #before do
        #Grape::Endpoint.before_each do |endpoint|
          #allow(endpoint).to receive(:upload_file).and_return "lolol.com"
        #end

        #test_image = Rails.root.join("spec", "fixtures", "catimage.jpg")
        #file = Rack::Test::UploadedFile.new(test_image, "image/jpeg")
        #post "/api/v1/cat_post", {
          #caption: "helloworld",
          #image_file: {filename: "hello.jpg", tempfile: file},
          #category: "Space"
        #}, {
          #"Auth-Token" => current_user.authentication_token,
          #"CONTENT_TYPE" => "application/json"
        #}
      #end
      #after { Grape::Endpoint.before_each nil }

      #it "returns 201" do
        #expect(response.status).to eq(201)
      #end

      #it "returns the newly created post" do
        #body = JSON.parse(response.body)
        #expect(body["caption"]).to eq("helloworld")
        #expect(body["category"]).to eq("Space")
        #expect(body["image_url"]).to eq("lolol.com")
      #end
    #end

    context "with image link" do
      before do
        post "/api/v1/cat_post", {
          caption: "helloworld",
          image_url: "zombo.com",
          category: "Space"
        }.to_json, {
          "Auth-Token" => current_user.authentication_token,
          "CONTENT_TYPE" => "application/json"
        }
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "returns the newly created post" do
        body = JSON.parse(response.body)
        expect(body["caption"]).to eq("helloworld")
        expect(body["category"]).to eq("Space")
        expect(body["image_url"]).to eq("zombo.com")
      end
    end
  end

  context "GET #show" do
    let!(:user_one) { create(:user) }
    let!(:user_two) { create(:user) }
    let!(:cat_post_0) { create(:cat_post, user_id: user_one.id) }
    let!(:cat_post_1) { create(:cat_post, user_id: user_two.id) }
    describe 'with no user parameters' do
      before do
        get "/api/v1/cat_post"
      end

      it "returns 200" do

        expect(response.status).to eq(200)
      end
    end

    describe 'with a user parameter' do

      before do
        get "/api/v1/cat_post", {
          user_id: user_one.id
        }
      end

      it "returns 200" do
        expect(response.status).to eq(200)
      end

      it "returns the right post" do
        body = JSON.parse(response.body)

        expect(body.length).to eq 1
      end
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
      puts body
      expect(body["server_id"]).to eql(cat_post_0.id.to_s)
    end
  end
end

