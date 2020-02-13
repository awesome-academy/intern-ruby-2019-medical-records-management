class Account < ApplicationRecord
  has_secure_password

  has_one :patient
  has_one :doctor
  has_many :posts

  enum role: [:patient, :doctor, :admin]

  attr_accessor :remember_token

  VALID_EMAIL_REGEX = Settings.mail_regex
  ACCOUNT_PARAMS = %i(name email password password_confirmation).freeze

  before_save :email_downcase

  validates :name, presence: true, length: {maximum: Settings.name_maximum}
  validates :email, presence: true, length: {maximum: Settings.email_maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.pass_minimum},
    allow_nil: true

  scope :search_by_name, ->(search){where("name LIKE '%#{search}%'") if search}

  delegate :address, :phone_number, :birthday, :image, to: :patient
  delegate :id, :specialist, :phone_number, to: :doctor, prefix: true

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = Account.new_token
    update_attributes remember_digest: Account.digest(remember_token)
  end

  def authenticated? remember_token
    return false unless remember_digest

    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attributes remember_digest: nil
  end

  private

  def email_downcase
    email.downcase!
  end
end
