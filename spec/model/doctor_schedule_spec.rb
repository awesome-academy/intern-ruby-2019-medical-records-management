require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe DoctorSchedule, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:doctor)}
  end
end
