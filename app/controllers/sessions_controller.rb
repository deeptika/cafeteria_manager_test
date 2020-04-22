class SessionsController < ApplicationController
  skip_before_action :ensure_user_login

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/home"
    else
      flash[:error] = "Your login attempt has either an invalid email or password. Please try again."
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
