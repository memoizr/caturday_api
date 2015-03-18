module Entity
  class CommentEntity < Grape::Entity
    expose :_id, as: :id
    expose :content
    expose :reply_to_user_ids
    #expose :positive_votes_count do |comment|
      #comment.votes.where(positive: true).count
    #end
    #expose :negative_votes_count do |comment|
      #comment.votes.where(positive: false).count
    #end
    #expose :total_votes_count do |comment|
      #comment.votes.count
    #end
    expose :commentable_id
    expose :commentable_type
    expose :user do |comment, options|
      UserEntity.new(comment.user, options)
    end
  end
end

