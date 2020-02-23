module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :message_doctor

    def connect
      account = Account.find_by id: cookies.signed[:account_id]

      if doctor
        self.message_doctor = account.doctor
      else
        reject_unauthorized_connection
      end
    end
  end
end
