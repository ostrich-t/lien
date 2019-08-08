require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      expect(user).not_to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      expect(another_user).not_to be_valid
    end

    it "is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "abcde", password_confirmation: "abcde")
      expect(user).not_to be_valid
    end
  end
end
