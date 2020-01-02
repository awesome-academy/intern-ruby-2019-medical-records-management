class Account < ApplicationRecord
  has_secure_password

  has_one :patient
  has_one :doctor
  has_many :posts

  VALID_EMAIL_REGEX = Settings.mail_regex
  ACCOUNT_PARAMS = %i(name email password password_confirmation).freeze

  before_save :email_downcase

  validates :name, presence: true, length: {maximum: Settings.name_maximum}
  validates :email, presence: true, length: {maximum: Settings.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.pass_minimum}

  private

  def email_downcase
    email.downcase!
  end
end
