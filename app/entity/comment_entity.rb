module Entity
  class CommentEntity < Grape::Entity
    expose :_id, as: :id
    expose :content
    expose :vote_count
    expose :commentable_id
    expose :commentable_type
    expose :user do |comment, options|
      UserLiteEntity.new(comment.user, options)
    end
  end
end

