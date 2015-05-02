module Entity
  class UserProfileEntity < Grape::Entity
    expose :_id, as: :server_id
    expose :username
    expose :image_url
    expose :cover_image_url
    expose :downloads
    expose :favorites
    expose :description
    expose :followers do |user, options|
      follows = Follow.find(user.follow_ids)
      follows.map{|follow| UserLiteEntity.new(follow.user)}
    end
    expose :following do |user, options|
      users = User.find(user.follows.map{|following| following.followable_id})
      users.map{|user| UserLiteEntity.new(user)}
    end
  end
end
