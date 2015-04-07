require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class HSBC < Base

      def initialize(branch, account_number, account_digit)
        account = account_number + account_digit
        @branch         = padding_with_zeros(branch, 4)
        @account_number = padding_with_zeros(account[0..5])
        @account_digit  = padding_with_zeros(account[6])
      end

      private

      def checksum
        "#{raw_checksum % 10}"
      end

      def raw_checksum
        @raw_checksum ||= multiply_factors % 11
      end

      def factors
        @factors ||= (2..9).reverse_each.cycle
      end

      def digits
        "#{@branch}#{@account_number}".chars.map(&:to_i)
      end
    end
  end
end
