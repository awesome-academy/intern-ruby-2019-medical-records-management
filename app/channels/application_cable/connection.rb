module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :message_account

    def connect
      account = Account.find_by id: cookies.signed[:account_id]

      if account
        self.message_account = account
      else
        reject_unauthorized_connection
      end
    end
  end
end
