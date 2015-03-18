module Entity
  class UserEntity < Grape::Entity
    expose :_id, as: :id
    expose :email
    expose :username
    expose :image_url
  end
end
