class ClerksController < ApplicationController
  def index
    @users = User.where(role: "clerk")
  end
end
