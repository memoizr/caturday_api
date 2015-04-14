module Api::Auth

  def warden
    env['warden']
  end

  def authenticated?
    if warden.authenticated?
      return true
    elsif params[:auth_token]
      @current_user = User.where(authentication_token: params[:auth_token]).last
    elsif headers["Auth-Token"]
      @current_user = User.where(authentication_token: headers["Auth-Token"]).last
    else
      error!({"error" => "Token invalid or expired"}, 401)
    end
  end

  def current_user
    @current_user
  end

end
