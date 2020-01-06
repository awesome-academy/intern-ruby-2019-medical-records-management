class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by email: params[:session][:email].downcase
    if account&.authenticate params[:session][:password]
      login account
      remember(account) if params[:session][:remember_me] == "1"
      redirect_to account
    else
      flash.now[:danger] = t "session_controller.invalid"
      render :new
    end
  end

  def destroy; end
end
