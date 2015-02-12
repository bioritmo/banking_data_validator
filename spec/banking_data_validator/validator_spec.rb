require "banking_data_validator/validator"

class Payment
  include ActiveModel::Model
  attr_accessor :bank_number, :branch_number, :account_number, :account_digit
  validates_with BankingDataValidator::Validator
end

class CustomPayment
  include ActiveModel::Model
  attr_accessor :c_bank, :c_branch, :c_account, :c_digit
  validates_with  BankingDataValidator::Validator,
                  bank_number:    :c_bank,
                  branch_number:  :c_branch,
                  account_number: :c_account,
                  account_digit:  :c_digit
end

module BankingDataValidator
  RSpec.describe Validator do
    it "requires a branch_number" do
      [nil, "X"].each do |invalid_number|
        payment = Payment.new(branch_number: invalid_number, account_number: "87362", account_digit: nil)
        expect(payment).to_not be_valid
        expect(payment.errors[:branch_number]).to include("is not a number")
      end
    end

    it "requires a account_number" do
      [nil, "X"].each do |invalid_number|
        payment = Payment.new(branch_number: "123", account_number: invalid_number, account_digit: "2")
        expect(payment).to_not be_valid
        expect(payment.errors[:account_number]).to include("is not a number")
      end
    end

    it "requires a valid account_digit" do
      valid_payment = Payment.new(bank_number: "341", branch_number: "8252", account_number: "09881", account_digit: "2")
      expect(valid_payment).to be_valid

      invalid_payment = Payment.new(bank_number: "341", branch_number: "8252", account_number: "09881", account_digit: "3")
      expect(invalid_payment).to_not be_valid
      expect(invalid_payment.errors[:account_digit]).to include("is invalid")
    end

    it "uses default field names when custom fields are not given" do
      expect(
        Payment.new(bank_number: nil, branch_number: "123", account_number: "0238069", account_digit: "2")
      ).to be_valid
    end

    it "accepts custom field names" do
      expect(CustomPayment.new(c_bank: nil, c_branch: "123", c_account: "0238069", c_digit: "2")).to be_valid
    end
  end
end
