require "active_model"
require "banking_data_validator/bank"

module BankingDataValidator
  class Validator < ActiveModel::Validator
    def initialize(options = {})
      super
      @bank_number    = options.fetch(:bank_number, :bank_number)
      @branch_number  = options.fetch(:branch_number, :branch_number)
      @account_number = options.fetch(:account_number, :account_number)
      @account_digit  = options.fetch(:account_digit, :account_digit)
    end

    def validate(record)
      bank_number    = record.public_send(@bank_number)
      branch_number  = record.public_send(@branch_number)
      account_number = record.public_send(@account_number)
      account_digit  = record.public_send(@account_digit)

      bank = Bank.build_class(bank_number)

      if !valid_number?(branch_number)
        record.errors.add(@branch_number, :not_a_number)
      end

      if !valid_number?(account_number)
        record.errors.add(@account_number, :not_a_number)
      elsif !bank.valid_account?(branch_number, account_number, account_digit)
        record.errors.add(@account_digit)
      end
    end

    private

    def valid_number?(number)
      Integer(number, 10)
    rescue
    end
  end
end
