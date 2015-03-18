class Api::V1::VoteApi < Grape::API
  resource :vote do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do
      vote = Vote.create!(
        user_id: params[:user_id],
        voteable_type: params[:voteable_type],
        voteable_id: params[:voteable_id],
        positive: params[:positive],
      )
    end
  end
end

