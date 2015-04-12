class Api::V1::UserApi < Grape::API
  resource :user do
    desc "Lists all user"

    # Require authentication
    before { authenticated? }

    ## GET
    get ':id' do
      user = User.find(params[:user_id])
      present user, with: Entity::UserEntity
    end

    ## PUT
    put do
      user = current_user
      if user
        user.update_attributes(
          description: params[:description]
        )
        present user, with: Entity::UserEntity
      else
        error! user.errors
      end
    end

    # CREATE
    post  do
      user = User.create!(
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      present user, with: Entity::UserEntity
    end
  end
end
