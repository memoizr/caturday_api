module Entity
  class FollowEntity < Grape::Entity
    expose :_id, as: :id
    expose :followable_id
    expose :followable_type
  end
end

