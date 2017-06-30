require 'rails_helper'

RSpec.describe Charge, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a uid, amount, and customer_id" do
    charge = Charge.new(
      uid: "Bob",
      amount: 2.00,
      customer_id: 1
    )
    charge.valid?
    expect(charge).to be_valid
  end

  it "is invalid without a uid" do
    charge = Charge.new(uid: nil)
    charge.valid?
    expect(charge.errors[:uid]).to include("can't be blank")
  end

  it "is invalid without an amount" do
    charge = Charge.new(amount: nil)
    charge.valid?
    expect(charge.errors[:amount]).to include("can't be blank")
  end

  it "is invalid without a customer_id" do
    charge = Charge.new(customer_id: nil)
    charge.valid?
    expect(charge.errors[:customer_id]).to include("can't be blank")
  end

  it "is valid without an associated user_id" do
    charge = Charge.new(
      user_id: nil,
      uid: "Bob",
      amount: 2.00,
      customer_id: 1
    )
    charge.valid?
    expect(charge).to be_valid
  end

  # it "is valid with an associated user_id" do
  #   charge = Charge.new(
  #     user_id: 2,
  #     uid: "Bob",
  #     amount: 2.00,
  #     customer_id: 1
  #   )
  #   charge.valid?
  #   expect(charge).to be_valid
  # end
end
