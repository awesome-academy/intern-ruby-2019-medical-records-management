class Notification < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  enum status: [:unseen, :seen]

  scope :order_by_create, ->{order created_at: :desc}
end
