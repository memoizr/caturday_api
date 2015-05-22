class Api::V1::GcmRegistrationApi < Grape::API
  resource :gcm_registration do

    # Require authentication
    before { authenticated? }

    # CREATE
    post  do
      current_user.register_gcm params[:registration_id]
      present current_user.reload, with: Entity::GcmRegistrationEntity
    end
  end
end
