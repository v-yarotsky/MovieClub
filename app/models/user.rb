class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :password, presence: true, length: { within: 8..128 }, on: :create
  validates :email, presence: true, on: :create
end

