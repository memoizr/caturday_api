module Entity
  class CatPostEntity < Grape::Entity
    expose :_id, as: :id
    expose :caption
    expose :image_url
    expose :category
    expose :download_count
    expose :vote_count

    #expose :reshares_count do |post, options|
      #post.reshares.count
    #end

    expose :user do |post, options|
      UserEntity.new(post.user, options).to_json
    end

    expose :comments do |post, options|
      post.comment_ids.map{|comment_id| CommentEntity.new(Comment.find(comment_id))}
    end
  end
end
