module Entity
  class CatPostEntity < Grape::Entity
    expose :_id, as: :id
    expose :caption
    expose :image_url
    expose :likes

    expose :userJSON do |post, options|
      post.user.to_json
    end

    expose :commentsJSON do |post, options|
      post.comments.to_json
    end
  end
end
