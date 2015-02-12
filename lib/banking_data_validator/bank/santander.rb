module BankingDataValidator
  module Bank
    class Santander
      def self.valid_account?(branch, account_number, account_digit)
        new(branch, account_number, account_digit).valid_account?
      end

      def initialize(branch, account_number, account_digit)
        @branch, @account_number, @account_digit = branch, account_number, account_digit
      end

      def valid_account?
        @account_digit.upcase == module10_santander
      end

      private

      def module10_santander
        factors = [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3].cycle

        total = "#{@branch}#{@account_number}".chars.map(&:to_i).inject(0) do |acc, digito|
          acc + (digito * factors.next % 10)
        end

        "#{10 - total % 10}"
      end
    end
  end
end
