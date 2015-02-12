require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Santander < Base
      private

      def checksum
        "#{raw_checksum % 10}"
      end

      def raw_checksum
        10 - multiply_factors
      end

      def multiply_factors
        digits.inject(0) do |total, digit|
          total + (digit * factors.next % 10)
        end
      end

      def digits
        "#{@branch}#{@account_number}".chars.map(&:to_i)
      end

      def factors
        @factors ||= [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3].cycle
      end
    end
  end
end
