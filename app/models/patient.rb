class Patient < ApplicationRecord
  belongs_to :account
  has_many :appointments
  has_many :medical_records, through: :appointments
  has_many :notifications

  delegate :name, to: :account
end
