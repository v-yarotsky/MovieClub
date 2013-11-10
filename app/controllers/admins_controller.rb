class AdminsController < ApplicationController
  respond_to :html

  set_authentication_scope :admin

  def show
  end
end

