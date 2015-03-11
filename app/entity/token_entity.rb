module Entity
  class TokenEntity < Grape::Entity
    expose :authentication_token, as: :authToken
  end
end
