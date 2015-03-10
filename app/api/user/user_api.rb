module UserApi
  class Data < Grape::API
    resource :user_data do
      desc "Lists all user"

      # Require authentication
      before { authenticated? }

      get do
        user = User.last
        present user, with: ::UserEntity
      end

      #put do
        #user = current_user
        #if user
          #user.update(
            #params
          #)
        #else
          #error! user.errors
        #end
      #end

    end
  end
end

