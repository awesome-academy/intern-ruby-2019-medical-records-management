class DoctorSchedule < ApplicationRecord
  belongs_to :doctor

  delegate :name, to: :doctor
  delegate :id, to: :doctor

  scope :select_doctors, ->(date){where(working_day: date)}
  scope :select_workingdates_by_doctor, ->(doctor_id){where(doctor_id: doctor_id)}
end
