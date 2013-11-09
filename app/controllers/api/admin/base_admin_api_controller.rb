module Api
  module Admin

    class BaseAdminApiController < BaseApiController
      set_authentication_scope :admin
    end

  end
end

