class Api::V1::CatPostApi < Grape::API
  resource :cat_post do

    # Require authentication
    #before { authenticated? }

    # SHOW
    get do
      cat_posts = CatPost.all.take 250
      present cat_posts, with: Entity::CatPostEntity
    end

    get ':id' do
      cat_post = CatPost.find(params[:id])
      present cat_post, with: Entity::CatPostEntity
    end

    # CREATE
    post  do
      cat_post = CatPost.create!(
        user: User.find(params[:user_id]),
        caption: params[:caption],
        image_url: params[:image_url]
      )
      present cat_post, with: Entity::CatPostEntity
    end
  end
end