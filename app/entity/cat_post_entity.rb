module Entity
  class CatPostEntity < Grape::Entity
    expose :_id, as: :server_id
    expose :caption
    expose :image_url
    expose :category
    expose :download_count
    expose :vote_count
    expose :user_id do |post, options|
      get_user(post).id
    end

    expose :reshare_count

    expose :user do |post, options|
      UserLiteEntity.new(get_user(post), options)
    end

    expose :comments do |post, options|
      comments = Comment.find(post.comment_ids)
      comments.map{|comment| CommentEntity.new(comment)}
    end
    def get_user(post)
      @user ||= (post.user)
    end
  end

end
