module LoggedUserConcern
    extend ActiveSupport::Concern

    include CurrentUserConcern

    included do
        before_action :check_current_user
      end

      def check_current_user
        if @current_user == nil
            render json: {status: 'ERROR', message: 'Please log in'},status: :ok
        end
    end
end
