module Entity
  class UserLiteEntity < Grape::Entity
    expose :_id, as: :server_id
    expose :username
    expose :image_url
  end
end
