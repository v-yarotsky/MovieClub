MovieClub::Application.routes.draw do
  namespace :api do
    resource :session, only: [:create, :destroy]

    resources :events do
      member do
        post :interested, as: :interested_in
      end
      collection do
        get :upcoming
      end
    end

    constraints AdminRouteConstraint.new do
      namespace :admin do
      end
    end
  end

  constraints AdminRouteConstraint.new do
    resource :admin, only: :show
  end

  resources :events, only: :index

  root "events#index"

  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)
end

