module Entity
  class GcmRegistrationEntity < Grape::Entity
    expose :gcm_registration, as: :registration_id
  end
end
