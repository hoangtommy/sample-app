# Controller to manage log in sessions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'invalid email or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
    flash[:notice] = 'you are now logged out'
  end
end