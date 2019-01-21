require 'rails_helper'

RSpec.describe User, type: :model do
  context "User with valid atributes" do
    it "should create a valid instance" do
      user = User.new(
        user_role_id: 1,
        name: "Usuario",
        email: "marcos@marcos.com",
        password: "123456",
        password_confirmation: "123456"
      )

      expect(user).to be_valid
    end
  end

  context "User with invalid atributes" do
    it "invalid email cannot be accepted" do
      user = User.new(
        user_role_id: 1,
        name: "Usuario",
        email: "naoeumemail"
      )

      expect(user).to be_invalid
    end
  end
end
