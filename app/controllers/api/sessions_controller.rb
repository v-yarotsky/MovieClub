module Api

  class SessionsController < DeviseController
    prepend_before_filter :require_no_authentication, only: :create
    prepend_before_filter :allow_params_authentication!, only: :create
    prepend_before_filter { request.env["devise.skip_timeout"] = true }

    def create
      user = warden.authenticate!
      sign_in(user)
      render json: { success: true, authenticity_token: form_authenticity_token }
    end

    def destroy
      sign_out
      render json: { success: true, authenticity_token: form_authenticity_token }
    end
  end

end

