module BankingDataValidator
  module Bank
    class Base
      def self.valid_account?(branch, account_number, account_digit)
        new(branch, account_number, account_digit).valid_account?
      end

      def initialize(branch, account_number, account_digit)
        @branch, @account_number, @account_digit = branch, account_number, account_digit
      end

      private

      def multiplier(factors)
        multiplier_position = factors.cycle

        @account_number.chars.map(&:to_i).reverse.inject(0) do |total, algarism|
          total + algarism * multiplier_position.next
        end
      end
    end
  end
end
