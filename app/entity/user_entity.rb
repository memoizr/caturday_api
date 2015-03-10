module Entity
  class UserEntity < Grape::Entity
    expose :_id
    expose :authentication_token
    expose :email
    expose :username
    expose :description
  end
end
