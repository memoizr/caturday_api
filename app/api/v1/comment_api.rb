class Api::V1::CommentApi < Grape::API
  resource :comment do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do
      comment = Comment.create!(
        user_id: current_user.id,
        commentable_type: params[:commentable_type],
        commentable_id: params[:commentable_id],
        content: params[:content]
      )
      post = CatPost.find(comment.commentable_id)
      present post, with: Entity::CatPostEntity
    end

    # DELETE
    delete  do
      comment = Comment.where(
        user_id: current_user.id,
        commentable_id: params[:commentable_id],
      )
      comment.first.destroy
    end
  end
end

