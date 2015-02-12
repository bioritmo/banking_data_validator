module BankingDataValidator
  module Bank
    class Brasil
      def self.valid_account?(branch, account_number, account_digit)
        new(branch, account_number, account_digit).valid_account?
      end

      def initialize(branch, account_number, account_digit)
        @branch, @account_number, @account_digit = branch, account_number, account_digit
      end

      def valid_account?
        @account_digit.upcase == module11_9to2_10_as_x
      end

      private

      def module11_9to2_10_as_x
        value = module11_9to2
        case value
        when 10 then "X"
        else "#{value}"
        end
      end

      def module11_9to2
        multiplier([9, 8, 7, 6, 5, 4, 3, 2]) % 11
      end

      def multiplier(factors)
        multiplier_position = factors.cycle

        @account_number.chars.map(&:to_i).reverse.inject(0) do |total, algarism|
          total + algarism * multiplier_position.next
        end
      end
    end
  end
end
