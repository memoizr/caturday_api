require 'spec_helper'

describe Api::V1::TokenApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }

  describe 'POST #create' do
    xit "returns 200" do
      post "/api/v1/token.json", {
        "email" => "foo@bar.com",
        "password" => "helloworld"
        }.to_json, {
          "CONTENT_TYPE" => "application/json"
        }

      parsed_response = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(parsed_response["authentication_token"]).to eq(current_user.authentication_token)
    end
  end
end

