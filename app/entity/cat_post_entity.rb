module Entity
  class CatPostEntity < Grape::Entity
    expose :_id, as: :id
    expose :caption
    expose :image_url
    expose :category
    expose :download_count
    expose :favorite_count

    #expose :reshares_count do |post, options|
      #post.reshares.count
    #end

    expose :user do |post, options|
      UserEntity.new(post.user, options).to_json
    end

    #expose :positive_votes_count do |post|
      #post.votes.where(positive: true).count
    #end

    #expose :negative_votes_count do |post|
      #post.votes.where(positive: false).count
    #end

    expose :total_votes_count do |post|
      post.votes.count
    end

    expose :comments do |post, options|
      post.comments.map{|i| CommentEntity.new(i)}
    end
  end
end
