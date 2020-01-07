class SessionsController < ApplicationController
  def new; end

  def create
    account = Account.find_by email: params[:session][:email].downcase
    if account&.authenticate params[:session][:password]
      login account
      check_remember account
      redirect_path account
    else
      flash.now[:danger] = t "session_controller.invalid"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = t "session_controller.logout"
    redirect_to root_path
  end

  private

  def check_remember account
    if params[:session][:remember_me] == Settings.remember_me
      remember account
    else
      forget account
    end
  end

  def redirect_path account
    if account.patient?
      redirect_to patient_path(account.patient)
    elsif account.doctor?
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
