require 'spec_helper'

describe User, :type => :model do
  describe 'create' do
    describe 'with valid parameters' do
      let(:user) { User.create(username: "foobar", password: "helloworld", email: "gmail@gmail.com")}

      it 'sets the username' do
        expect(user.username).to eq("foobar")
      end

      it 'sets the email' do
        expect(user.email).to eq("gmail@gmail.com")
      end
    end
  end
end
