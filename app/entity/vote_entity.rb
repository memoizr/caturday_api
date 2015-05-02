module Entity
  class VoteEntity < Grape::Entity
    expose :_id, as: :id
    expose :positive
  end
end
