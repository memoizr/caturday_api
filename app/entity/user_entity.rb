module Entity
  class UserEntity < Grape::Entity
    expose :_id, as: :id
    expose :email
    expose :username
    expose :image_url
    expose :downloads
    expose :authentication_token
    expose :favorites
  end
end
