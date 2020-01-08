class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :medical_record

  APPOINTMENT_PARAMS = %i(time).freeze
end
