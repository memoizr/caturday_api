class Api::V1::UserApi < Grape::API
  resource :user do
    desc "Lists all user"

    # Require authentication

    ## GET
    get ':id' do
      user = ::User.find(params[:id])
      present user, with: Entity::UserProfileEntity
    end

    ## PUT
    put do
      if authenticated?
        user = current_user
        if user
          user.update_attributes(
            params
          )
          present user, with: Entity::UserProfileEntity
        else
          error! user.errors
        end
      else
        error! 'Unauthorized, invalid password email', 401
      end
    end
  end
end
