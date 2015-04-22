require 'spec_helper'

describe User, :type => :model do
  describe 'create' do
    let!(:user) { create(:user,
                         username: "foobar",
                         email: "i@i.i",
                         password: "helloworld") }

    describe 'with valid parameters' do

      it 'sets the username' do
        expect(user.username).to eq("foobar")
      end

      it 'sets the email' do
        expect(user.email).to eq("i@i.i")
      end

      it 'creates an initial auth token' do
        expect(user.reload.authentication_token).not_to be_empty
      end
    end
  end

  describe 'log_in' do
      let!(:user) { create(:user, password: "helloworld") }

      before do
        @current_user = user.log_in("helloworld")
      end
      it 'logs in with correct password and email' do
        expect(@current_user).to eq user
      end

      it 'increments the number of logins' do
        expect(user.reload.sign_in_count).to eq 1
      end

      it 'sets authentication token' do
        expect(user.reload.authentication_token).not_to be_nil
      end

      it 'sets the right current login time' do
        expect(user.reload.current_sign_in_at).not_to be_nil
      end
  end

  describe 'log_out' do
      let!(:user) { create(:user, password: "helloworld") }


      before do
        @current_user = user.log_out
      end

      it 'sets the last sign in time' do
        expect(user.reload.last_sign_in_at).not_to be_nil
      end
  end
end
