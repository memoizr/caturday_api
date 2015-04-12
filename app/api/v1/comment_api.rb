class Api::V1::CommentApi < Grape::API
  resource :comment do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do
      puts params
      comment = Comment.create!(
        user_id: params[:user_id],
        commentable_type: params[:commentable_type],
        commentable_id: params[:commentable_id],
        content: params[:content],
        reply_to_user_ids: params[:reply_to_user_ids]
      )
      present comment, with: Entity::CommentEntity
    end
  end
end

