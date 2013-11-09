Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :password
  manager.default_scope = :user
  manager.serialize_into_session { |user| user.id }
  manager.serialize_from_session { |id| User.find(id) }
  manager.failure_app = ->(env) { [401, { "Content-Type" => "application/json" }, [{ success: false, message: env["warden"].message }.to_json]] }
end

Warden::Strategies.add(:password) do
  def authenticate!
    params = env["action_dispatch.request.parameters"]
    user = User.find_by_email(params["email"])
    if user && user.authenticate(params["password"])
      success! user
      if user.admin?
        env["warden"].set_user(user, scope: :admin) # so admin doesn't have to authenticate twice
      end
    else
      fail "Incorrect email or password"
    end
  end
end

