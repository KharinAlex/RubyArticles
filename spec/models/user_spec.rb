require 'rails_helper'

describe User do

  it "has a valid factory" do
    expect(FactoryBot.build(:user).save).to be true
  end

  it "is invalid without a name" do
    expect(FactoryBot.build(:user, name: nil).save).to be false
  end

  it "is invalid without a unique name" do
    user = FactoryBot.create(:user)
    expect(FactoryBot.build(:user, name: user.name).save).to be false
  end

  it "is invalid without an email" do
    expect(FactoryBot.build(:user, email: nil).save).to be false
  end
end