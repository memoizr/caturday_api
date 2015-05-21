require 'spec_helper'

describe Api::V1::GcmRegistrationApi, :type => :request do
  let!(:current_user) { create(:user, username: 'Foobar', email: "foo@bar.com", password: 'helloworld') }

  context 'cat_post vote' do
    describe 'POST' do

      before do
        post "/api/v1/gcm_registration", {
          registration_id: "123456",
        }.to_json, { "Auth-Token" => current_user.authentication_token, "Content-Type" => "application/json"}
      end

      it "returns 201" do
        expect(response.status).to eq(201)
      end

      it "it updates the post" do
        expect(current_user.reload.gcm_registration).to eq "123456"
      end
    end
  end
end

