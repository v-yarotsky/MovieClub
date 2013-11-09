module Api

  class BaseApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    before_filter :authenticate_user!

    private

    def authenticate_user!
      warden.authenticate!
    end
  end

end

