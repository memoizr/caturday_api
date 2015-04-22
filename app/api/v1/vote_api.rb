class Api::V1::VoteApi < Grape::API
  resource :vote do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do
      vote = Vote.create!(
        user_id: current_user.id,
        voteable_type: params[:voteable_type],
        voteable_id: params[:voteable_id],
        positive: params[:positive]
      )
      present vote, with: Entity::VoteEntity
    end

    # DELETE
    delete  do

      vote = Vote.where(
        voteable_id: params[:voteable_id],
        user_id: current_user.id
      )
      vote.first.destroy
    end
  end
end
