module SessionsHelper
  def login account
    session[:account_id] = account.id
  end

  def current_account
    if account_id = session[:account_id]
      @current_account ||= Account.find_by id: account_id
    elsif account_id = cookies.signed[:account_id]
      account = Account.find_by id: account_id

      if account&.authenticated? :remember, cookies[:remember_token]
        log_in account
        @current_account = account
      end
    end
  end

  def logged_in?
    current_account.present?
  end

  def remember account
    account.remember
    cookies.permanent.signed[:account_id] = account.id
    cookies.permanent[:remember_token] = account.remember_token
  end
end
