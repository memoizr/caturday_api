class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    user.skip_confirmation!
    if user.save
      sign_in user
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :username => user.username,
                      :email => user.email,
                      :id => user.id,
                      :auth_token => current_user.authentication_token }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => user.errors,
                        :data => {} }
    end
  end
end
