class Doctor < ApplicationRecord
  belongs_to :account
  has_many :appointments
  has_many :doctor_schedules
  has_many :notifications

  delegate :name, to: :account
end
