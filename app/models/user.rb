class User < ActiveRecord::Base
  devise :invitable, :database_authenticatable, :token_authenticatable, :recoverable, :rememberable, :validatable
end
