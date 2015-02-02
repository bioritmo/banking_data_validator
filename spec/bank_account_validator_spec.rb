require "bank_account_validator"

RSpec.describe BankAccountValidator do

  it "requires a branch_number" do
    [nil, "X"].each do |invalid_branch_number|
      payment = Payment.new(branch_number: invalid_branch_number, account_number: "87362", account_digit: nil)
      expect(payment).to_not be_valid
      expect(payment.errors[:branch_number]).to include("is not a number")
    end
  end

  it "requires a account_number" do
    [nil, "X"].each do |invalid_account_number|
      payment = Payment.new(branch_number: "123", account_number: invalid_account_number, account_digit: "2")
      expect(payment).to_not be_valid
      expect(payment.errors[:account_number]).to include("is not a number")
    end
  end

  it "requires a check digit" do
    payment = Payment.new(bank_number: "237", branch_number: "123", account_number: "87362", account_digit: "0")
    expect(payment).to_not be_valid
    expect(payment.errors[:account_digit]).to include("is invalid")
  end

  it "uses default field names when custom field is not given" do
    valid_attributes.each { |attributes| expect(Payment.new(attributes)).to be_valid }
  end

  it "accepts custom field names" do
    expect(CustomPayment.new(c_bank: "237", c_branch: "123", c_account: "0238069", c_digit: "2")).to be_valid
  end

  describe "Bradesco" do
    it "validates account digits" do
      valid_attributes.each { |attributes| expect(Payment.new(attributes)).to be_valid }

      expect(Payment.new(bank_number: "237", branch_number: "123", account_number: "87362", account_digit: "2")).to_not be_valid
    end
  end
end

def valid_attributes
[
  {branch_number: "123", account_number: "0238069", account_digit: "2"},
  {branch_number: "123", account_number: "160000", account_digit: "1"},
  {branch_number: "123", account_number: "87087", account_digit: "0"},
  {branch_number: "123", account_number: "71000", account_digit: "8"},
  {branch_number: "123", account_number: "3257", account_digit: "3"}
]
end

class Payment
  include ActiveModel::Model
  attr_accessor :bank_number, :branch_number, :account_number, :account_digit
  validates_with BankAccountValidator
end

class CustomPayment
  include ActiveModel::Model
  attr_accessor :c_bank, :c_branch, :c_account, :c_digit
  validates_with BankAccountValidator, bank_number: :c_bank, branch_number: :c_branch, account_number: :c_account, account_digit: :c_digit
end
