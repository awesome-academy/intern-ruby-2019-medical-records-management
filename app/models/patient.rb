class Patient < ApplicationRecord
  belongs_to :account
  has_many :appointments

  delegate :name, to: :account
end
