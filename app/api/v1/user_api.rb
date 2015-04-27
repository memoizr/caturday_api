class Api::V1::UserApi < Grape::API
  resource :user do
    desc "Lists all user"

    # Require authentication

    ## GET
    get ':id' do
      user = ::User.find(params[:id])
      present user, with: Entity::UserEntity
    end

    ## PUT
    put do
      if authenticated?
        user = current_user
        if user
          user.update_attributes(
            params
          )
          present user, with: Entity::UserEntity
        else
          error! user.errors
        end
      else
        error! 'Unauthorized, invalid password email', 401
      end
    end

    # CREATE
    post  do
      user = ::User.create!(
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      present user, with: Entity::UserEntity
    end
  end
end
