class MedicalRecord < ApplicationRecord
  belongs_to :appointment

  MEDICAL_RECORD_PARAMS = %i(content).freeze

  delegate :doctor_id, :doctor_name, :time, :doctor_image, to: :appointment
end
