require 'rails_helper'
require 'factory_bot'


RSpec.describe User, type: :model do
  before(:each) do
		@user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
    describe "#email" do
      it { expect(@user).to validate_presence_of(:email) }
      it { expect(@user).to validate_uniqueness_of(:email) }
      it { is_expected.to allow_value("email@addresse.foo").for(:email) }
      it { is_expected.to_not allow_value("foo").for(:email) }
      it { is_expected.to_not allow_value("jean@examplecom").for(:email) }
		end
  end


  context "associations" do
    it {expect(@user).to_have_many(:attendances).with_foreign_key(:user)}
    it {expect(@user).to_have_many(:events).with_foreign_key(:user)}


  end
end
