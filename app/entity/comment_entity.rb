module Entity
  class CommentEntity < Grape::Entity
    expose :_id, as: :id
    expose :content
    expose :user do |comment, options|
      UserEntity.new(comment.user, options)
    end
    expose :likes
  end
end

