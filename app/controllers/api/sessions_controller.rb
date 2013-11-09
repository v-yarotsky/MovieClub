module Api

  class SessionsController < BaseApiController
    skip_before_filter :authenticate_user!, only: :create

    def create
      warden.authenticate!
      render json: { success: true, authenticity_token: form_authenticity_token }
    end

    def destroy
      warden.logout
      render json: { success: true, authenticity_token: form_authenticity_token }
    end
  end

end

