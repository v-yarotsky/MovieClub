Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = ->(env) { [401, { "Content-Type" => "application/json" }, [{ success: false, message: env["warden"].message }.to_json]] }
end

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.find(id)
end

Warden::Strategies.add(:password) do
  def authenticate!
    params = env["action_dispatch.request.parameters"]
    user = User.find_by_email(params["email"])
    if user && user.authenticate(params["password"])
      success! user
    else
      fail "Incorrect email or password"
    end
  end
end

