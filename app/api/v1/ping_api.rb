class Api::V1::PingApi < Grape::API
  resource :ping do

    before { authenticated? }
    #before :authenticate_user!

    get do
      {"ping" => "pongator"}
    end

    post do
      pong = params[:password]
      {"pong" => "#{pong} and this is a response"}
    end

  end
end


