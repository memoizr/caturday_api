class Api::V1 < Grape::API
  prefix 'api'
  version 'v1', using: :path

  helpers Api::Auth

  mount UserApi
  mount CatPostApi
  mount TokenApi
  mount CommentApi
end

