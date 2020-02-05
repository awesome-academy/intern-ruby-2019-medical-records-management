require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Doctor, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:account)}
    it{is_expected.to have_many(:appointments)}
    it{is_expected.to have_many(:doctor_schedules)}
  end
end
