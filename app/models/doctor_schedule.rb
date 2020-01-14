class DoctorSchedule < ApplicationRecord
  belongs_to :doctor

  delegate :name, to: :doctor
  delegate :id, to: :doctor

  scope :select_doctors, ->(date){where(working_day: date)}
end
