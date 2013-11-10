module Authenticatable
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)

    base.class_eval do
      before_filter :authenticate_user!
      helper_method :current_user
      helper_method :user_signed_in?
    end
  end

  module ClassMethods
    def set_authentication_scope(scope)
      define_method :authentication_scope do
        scope.to_sym
      end
      private :authentication_scope
    end
  end

  module InstanceMethods
    def authenticate_user!
      warden.authenticate!(scope: authentication_scope)
    end

    def current_user
      warden.user(authentication_scope)
    end

    def user_signed_in?
      !!current_user
    end

    def warden
      env["warden"]
    end

    # Can be overridden by calling .set_authentication_scope
    #
    def authentication_scope
      nil
    end
  end
end

