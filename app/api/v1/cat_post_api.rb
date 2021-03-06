class Api::V1::CatPostApi < Grape::API
  resource :cat_post do

    helpers do
      def upload_file(image_file, category)
        file = GoogleManager.google_bucket.files.create(
          key: "#{Time.now.to_i}_post_#{category}_#{SecureRandom.hex}#{File.extname(image_file.filename)}",
          body: image_file.tempfile,
          public: true
        )
        file.public_url
      end
    end

    # SHOW
    get do
      user_id = params[:user_id]
      page = params[:page]
      category = params[:category]
      if user_id
        cat_posts = CatPost.where(user_id: user_id).sort(:created_at.desc).page(page).all
      else
        cat_posts = CatPost.where(category: category).sort(:created_at.desc).page(page).all
      end
      present cat_posts, with: Entity::CatPostEntity
    end

    # GET
    get ':id' do
      cat_post = CatPost.find(params[:id])
      present cat_post, with: Entity::CatPostEntity
    end


    # CREATE
    post  do

      if authenticated?
        cat_post = CatPost.create!(
          user_id: current_user.id,
          caption: params[:caption],
          image_url: params[:image_url] ? params[:image_url] : upload_file(params[:image_file], params[:category]),
          category: params[:category]
        )

        present cat_post, with: Entity::CatPostEntity
      end
    end

    delete ':id' do
      if authenticated?
        cat_post = CatPost.find(params[:id])
        cat_post.destroy
      end
    end
  end
end

