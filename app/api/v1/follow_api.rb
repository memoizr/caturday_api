class Api::V1::FollowApi < Grape::API
  resource :follow do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do

      vote = Follow.create!(
        user_id: current_user.id,
        followable_type: params[:followable_type],
        followable_id: params[:followable_id]
      )

      present vote, with: Entity::FollowEntity
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
