require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Appointment, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:patient)}
    it{is_expected.to belong_to(:doctor)}
    it{is_expected.to have_one(:medical_record)}
  end
end
