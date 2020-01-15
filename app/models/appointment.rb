class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :medical_record

  APPOINTMENT_PARAMS = %i(time).freeze

  delegate :name, :image, :id, to: :patient, prefix: true
  delegate :name, :image, to: :doctor, prefix: true
end
