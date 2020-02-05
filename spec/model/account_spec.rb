require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) {FactoryBot.create :account}

  describe "Associations" do
    it{should have_one(:patient)}

    it{should have_one(:doctor)}
  end

  describe "Validations" do
    it{should validate_presence_of(:name)}
    it{should validate_length_of(:name).is_at_most(Settings.name_maximum)}

    it{should validate_presence_of(:email)}
    it{should validate_length_of(:email).is_at_most(Settings.email_maximum)}
    it{should validate_uniqueness_of(:email).ignoring_case_sensitivity}

    context "Email invalid format" do
      it{should allow_value("abcdef@gmail.com").for(:email)}
    end

    it{should validate_presence_of(:password)}
    it{should validate_length_of(:password).is_at_least(Settings.pass_minimum)}

    context "Before save" do
      it "Downcase email" do
        expect(account.email).to eq (account.email.downcase)
        account.destroy
      end
    end
  end

  describe "Class method" do
    context ".new_token" do
      it "new token true" do
        expect(described_class.new_token).not_to be_nil
      end
    end

    context ".digest" do
      it "create digest token" do
        expect(described_class.digest(described_class.new_token)).not_to be_nil
      end
    end
  end

  describe "Instance method" do
    context "#remember" do
      before{account.remember}

      it "Remember success" do
        expect(account.remember_digest).not_to be_nil
        account.destroy
      end
    end

    context "#forget" do
      before do
        account.remember
        account.forget
      end

      it "Forget sucess" do
        expect(account.remember_digest).to be_nil
        account.destroy
      end
    end

    context "#authenticated?" do
      it "Authenticated true" do
        account.remember
        expect(account.authenticated? account.remember_token).to be true
        account.destroy
      end

      it "Authenticated false" do
        expect(account.authenticated? account.remember_token).not_to be true
        account.destroy
      end
    end
  end
end
