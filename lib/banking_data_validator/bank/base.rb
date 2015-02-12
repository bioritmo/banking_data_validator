module BankingDataValidator
  module Bank
    class Base
      def self.valid_account?(branch, account_number, account_digit)
        new(branch, account_number, account_digit).valid_account?
      end

      def initialize(branch, account_number, account_digit)
        @branch, @account_number, @account_digit = branch, account_number, account_digit
      end

      def valid_account?
        @account_digit.upcase == checksum
      end

      private

      def multiply_factors
        digits.reverse.inject(0) do |total, algarism|
          total + algarism * factors.next
        end
      end

      def digits
        @account_number.chars.map(&:to_i)
      end
    end
  end
end
