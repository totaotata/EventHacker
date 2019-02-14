require 'rails_helper'
require 'factory_bot'

RSpec.describe Event, type: :model do
  before(:each) do
		@event = FactoryBot.create(:event)
  end

  it "has a valid factory" do
    expect(build(:event)).to be_valid
  end
  context "validation" do
    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
    end


		end
  end
