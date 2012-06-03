require 'spec_helper'

describe User do
  before { @user = User.new(email: "user@example.com", password: "watermelon", password_confirmation: "watermelon") }

  subject { @user }

  it { should respond_to(:email) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
end
