require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  describe "GET #show" do
    let(:account){FactoryBot.create :account}
    let(:doctor){FactoryBot.create :doctor, account_id: account.id}
    before{get :show, params: {id: doctor.id}}

    it "Assign @patient" do
      expect(assigns(:doctor)).to eq doctor
    end

    it "Assign @appointments" do
      expect(assigns(:appointments)).to eq doctor.appointments
    end
  end
end
