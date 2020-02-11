require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  describe "GET #index" do
    before{get :index}
    let(:account){FactoryBot.create :account}

    it "Return to success response" do
      expect(response).to be_success
    end

    it "Assign @patients_searched" do
      expect(assigns(:patients_searched)).to eq Account.patient
    end
  end

  describe "GET #show" do
    let(:account){FactoryBot.create :account}
    let(:patient){FactoryBot.create :patient, account_id: account.id}
    before{get :show, params: {id: patient.id}}

    it "Assign @patient" do
      expect(assigns(:patient)).to eq patient
    end

    it "Assign @appointments" do
      expect(assigns(:appointments)).to eq patient.appointments
    end
  end
end
