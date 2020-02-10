require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  describe "GET #new" do
    before{get :new}

    it "Return to success response" do
      expect(response).to be_success
    end

    it "Render sign up template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    context "With valid attributes" do
      before{post :create, params: {account: FactoryBot.attributes_for(:account)}}

      it "creates a new account" do
        expect(assigns(:account)).to be_a Account
      end

      it "redirects to the new account" do
        expect(response).to redirect_to account_path(Account.last)
      end
    end

    context "With invalid attributes" do
      before{post :create, params: {account: FactoryBot.attributes_for(:account, email: "")}}

      it "Render sign up template" do
        expect(response).to render_template :new
      end
    end
  end
end
