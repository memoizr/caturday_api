class Api::V1::CatPostApi < Grape::API
  resource :cat_post do

    helpers do
      def upload_file(image_file)
          #name = image_file.filename
          #directory = "public/"
          #path = File.join(directory, name)
          #File.open(path, "wb") { |f| f.write(image_file.tempfile.read) }
          "http://26.media.tumblr.com/tumblr_lz1xhtmpvK1r4bme3o1_1280.jpg"
      end
    end

    # SHOW
    get do
      page = params[:page]
      category = params[:category]
      cat_posts = CatPost.where(category: category).sort(:created_at.desc).page(page).all
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
          image_url: params[:image_url] ? params[:image_url] : upload_file(params[:image_file]),
          category: params[:category]
        )

        present cat_post, with: Entity::CatPostEntity
      else
         puts "not logged in"
      end
    end

  end
end

