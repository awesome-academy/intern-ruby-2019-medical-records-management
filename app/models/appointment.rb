class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :medical_record

  validate :check_time
  validates :time, presence: true

  APPOINTMENT_PARAMS = %i(time).freeze

  delegate :name, :image, :id, to: :patient, prefix: true
  delegate :name, :image, :id, to: :doctor, prefix: true

  private

  def check_time
    return unless time.present? && time < Date.today
    errors.add(:time, I18n.t("models.appointment.invalid_time"))
  end
end
