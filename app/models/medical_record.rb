class MedicalRecord < ApplicationRecord
  belongs_to :appointment

  MEDICAL_RECORD_PARAMS = %i(content).freeze
end
