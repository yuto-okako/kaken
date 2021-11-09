class SessionsController < ApplicationController
  def new
    @error = false
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path
    else
      @error = true
      render 'sessions/new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end