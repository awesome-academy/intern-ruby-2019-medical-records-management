class Account < ApplicationRecord
  has_one :patient
  has_one :doctor
  has_many :posts
end
