class Api::V1::FollowApi < Grape::API
  resource :follow do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do

      follow = ::Follow.create!(
        user_id: current_user.id,
        followable_type: "User",
        followable_id: params[:followable_id]
      )

      user = ::User.find(follow.followable_id)

      present user, with: Entity::UserProfileEntity
    end

    # DELETE
    delete  do

      follow = Follow.where(
        followable_id: params[:followable_id],
        user_id: current_user.id
      )
      follow.first.destroy
    end
  end
end
