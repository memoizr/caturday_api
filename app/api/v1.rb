class Api::V1 < Grape::API
  prefix 'api'
  version 'v1', using: :path

  format :json
  default_format :json

  helpers Api::Auth


  mount UserApi
  mount CatPostApi
  mount CommentApi
  mount PingApi
  mount VoteApi
  mount FollowApi
  mount SessionApi
end

