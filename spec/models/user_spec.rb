require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = User.new(email: "testemail@domain.com", password:"rspec123")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.name = @user.email.upcase
      user_with_same_name.save
    end

    it { should_not be_valid }
  end
end
