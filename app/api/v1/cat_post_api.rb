class Api::V1::CatPostApi < Grape::API
  resource :cat_post do

    # Require authentication
    #before { authenticated? }

    # SHOW
    get do
      page = params[:page]
      category = params[:category]
      cat_posts = CatPost.where(category: category).page(page).all
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

    put ':id/download' do
      id = params[:id]
      user_id = params[:user_id]
      cat_post = CatPost.find(id)
      cat_post.add_download id
      if user_id
        user = User.find(user_id)
        user.add_download(user_id, id)
      end
      present cat_post.reload, with: Entity::CatPostEntity
    end

    put ':id/favorite' do
      id = params[:id]
      user_id = params[:user_id]
      cat_post = CatPost.find(id)
      cat_post.add_favorite id

      if user_id
        user = User.find(user_id)
        user.add_favorite(user_id, id)
      end

      present cat_post.reload, with: Entity::CatPostEntity
    end
  end
end

