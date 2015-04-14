module Entity
  class CatPostEntity < Grape::Entity
    expose :_id, as: :id
    expose :caption
    expose :image_url
    expose :category
    expose :download_count
    expose :vote_count

    expose :reshare_count

    expose :user do |post, options|
      UserEntity.new(post.user, options).to_json
    end

    expose :comments do |post, options|
      comments = Comment.find(post.comment_ids)
      comments.map{|comment| CommentEntity.new(comment)}
    end
  end
end
