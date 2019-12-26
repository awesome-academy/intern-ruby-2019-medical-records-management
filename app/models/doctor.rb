class Doctor < ApplicationRecord
  belongs_to :account
  has_many :appointments
  has_many :doctor_schedules
end
