require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Patient, type: :model do
  describe "Associations" do
    it{is_expected.to belong_to(:account)}
    it{is_expected.to have_many(:appointments)}
    it{is_expected.to have_many(:medical_records).through(:appointments)}
  end
end
