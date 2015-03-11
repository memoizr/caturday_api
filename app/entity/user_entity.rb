module Entity
  class UserEntity < Grape::Entity
    expose :_id, as: :id
    expose :email
    expose :username
  end
end
