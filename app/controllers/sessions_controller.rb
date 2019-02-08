# Controller to manage log in sessions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log users in and show their homepage
    else
      flash.now[:danger] = 'invalid email or password combination'
      render 'new'
    end
  end

  def destroy; end
end
