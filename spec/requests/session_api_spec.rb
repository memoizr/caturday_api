require 'spec_helper'

describe Api::V1::SessionApi, :type => :request do

  describe "post" do
    describe 'login' do
      let!(:user) { create(:user, username: 'Foobar', email: "oo@bar.com", password: 'helloworld') }

      before do
        post "/api/v1/sessions/login", {
          email: "oo@bar.com", password: Base64.encode64("helloworld")
        }
      end

      it "returns right user" do
        body = JSON.parse(response.body)
        expect(body["username"]).to eq user.username
        expect(body["authentication_token"]).to eq user.authentication_token
      end
    end

    describe 'register' do

      before do
        post "/api/v1/sessions/register", {
          email: "choo@foo.com",
          username: "foobars",
          password: Base64.encode64("helloworld")
        }
      end

      it "returns right user" do
        body = JSON.parse(response.body)
        expect(body["username"]).to eq "foobars"
      end
    end

    describe "logout" do
      let!(:user) { create(:user, username: 'Foobar', email: "oo@bar.com", password: 'helloworld') }
      before do
        delete "/api/v1/sessions/logout", {
        }.to_json, { "Auth-Token" => user.authentication_token, "Content-Type" => "application/json"}
      end

      it "responds with 200" do
        body = JSON.parse(response.body)
        expect(body["ok"]).to eq 1
      end

    end
  end
end

