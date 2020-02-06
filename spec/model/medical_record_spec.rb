require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe MedicalRecord, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:appointment)}
  end
end
