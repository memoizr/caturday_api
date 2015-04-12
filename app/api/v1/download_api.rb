class Api::V1::DownloadApi < Grape::API
  resource :comment do

    # CREATE
    post  do
      cat_post = CatPost.find(params[:cat_post_id]).first
      cat_post.
      present comment, with: Entity::CommentEntity
    end
  end
end

