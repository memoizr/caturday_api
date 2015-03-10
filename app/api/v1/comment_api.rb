class Api::V1::CommentApi < Grape::API
  resource :comment do
    #
    # Require authentication
    before { authenticated? }

    get do
      present Comment.all, with: Entity::CommentEntity
    end

    # CREATE
    post  do
      Comment.create!(
        author: params[:author],
        message: params[:message],
        image_url: params[:image_url]
      )
      render nothing: true
    end
  end
end

