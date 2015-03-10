module Entity
  class CatPostEntity < Grape::Entity
    expose :_id
    expose :caption
    expose :image_url
    expose :likes
    expose :comments do |post, options|
      post.comments.map{|i| CommentEntity.new(i,options)}
    end
  end
end
