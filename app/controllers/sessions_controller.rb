# Controller to manage log in sessions
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # log users in and show their homepage
    else
      render 'new'
    end
  end

  def destroy; end
end
