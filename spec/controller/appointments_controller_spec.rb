require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  describe "GET #new" do
    before{get :new}

    context "Loged in" do
      it "Return to success response" do
        expect(response).to be_success
      end

      it "Render sign up template" do
        expect(response).to render_template :new
      end
    end

    context "Not loged in" do
      it "Redirect to login" do
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "POST #create" do

    context "With valid attributes" do
      before{post :create, params: {appointment: FactoryBot.attributes_for(:appointment)}}

      it "creates a new appointment" do
        expect(assigns(:appointment)).to be_a Appointment
      end
    end

    context "With invalid attributes" do
      before{post :create, params: {appointment: FactoryBot.attributes_for(:appointment, doctor_id: "")}}

      it "Render sign up template" do
        expect(response).to render_template :new
      end
    end
  end
end
