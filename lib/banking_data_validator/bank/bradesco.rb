require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Bradesco < Base

      def initialize(branch, account_number, account_digit)
        super
        @account_digit = padding_with_zeros(account_digit.to_i)
      end

      private

      def checksum
        case raw_checksum
        when 1..9 then "#{raw_checksum}"
        else "0"
        end
      end

      def raw_checksum
        @raw_checksum ||= 11 - multiply_factors % 11
      end

      def factors
        @factors ||= (2..7).cycle
      end
    end
  end
end
