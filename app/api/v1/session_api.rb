class Api::V1::SessionApi < Grape::API

  resources :sessions do
    desc "Authenticate user and return user object, access token"

    params do
      requires :email, type: String, desc: "Email"
      requires :password, type: String, desc: "Password"
    end

    post 'login' do
      email = params[:email]
      password = Base64.decode64(params[:password])

      user = ::User.find_by_email(email) rescue nil

      if user && user.log_in(password)
        present user.reload, with: Entity::UserEntity
      else
        error! 'Unauthorized, invalid password email', 401
      end
    end

    desc "Register user and return user object, access token"
    params do
      requires :username, type: String, desc: "Username"
      requires :email, type: String, desc: "Email"
      requires :password, type: String, desc: "Password"
    end

    post 'register' do
      user = User.create!(
        username:   params[:username],
        password:   Base64.decode64(params[:password]),
        email:      params[:email]
      )
      present user, with: Entity::UserEntity
    end

    desc "Logout user and return user object, access token"

    delete 'logout' do

      if authenticated?
        current_user.log_out
      else
        error!({:error_code => 404, :error_message => "Invalid token."}, 401)
      end
    end
  end
end
