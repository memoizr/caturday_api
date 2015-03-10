class Api::V1::TokenApi < Grape::API
  resource :token do

    ## CREATE
    desc "Create new token", {
      notes: 'Generate auth token for user'
    }
    params do
      requires :email, type: String, desc: "Email"
      requires :password, type: String, desc: "Password"
    end

    ## POST
    post do
      user = User.find_by_email(params[:email]) rescue nil
      if user && user.valid_password?(params[:password])
        user.ensure_authentication_token!
        present user, with: Entity::UserEntity
      else
        error! 'Unauthorized, invalid password email', 401
      end
    end

    ## DELETE
    desc "Revoke token"
    delete do
      authenticated?
      unless current_user.reset_authentication_token!
        error! 'Could not process', 501
      end
    end
  end
end
