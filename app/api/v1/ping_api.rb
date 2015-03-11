class Api::V1::PingApi < Grape::API
  resource :ping do

    get do
      {"ping" => "pongator"}
    end

    post do
      pong = params[:password]
      {"pong" => "#{pong} and this is a response"}
    end

  end
end


