module Entity
  class UserEntity < Grape::Entity
    expose :_id, as: :server_id
    expose :email
    expose :username
    expose :image_url
    expose :cover_image_url
    expose :downloads
    expose :authentication_token
    expose :favorites
    expose :gcm_registration
  end
end
