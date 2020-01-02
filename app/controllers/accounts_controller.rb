class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      flash[:success] = t "accounts_controller.signup_success"
      redirect_to @account
    else
      render :new
    end
  end

  def show
    @account = Account.find_by id: params[:id]
    return if @account
    flash[:danger] = t"accounts_controller.user_not_found"
    redirect_to root_path
  end

  private

  def account_params
    params.require(:account).permit Account::ACCOUNT_PARAMS
  end
end
