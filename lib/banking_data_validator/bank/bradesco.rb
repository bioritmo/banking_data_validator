module BankingDataValidator
  module Bank
    class Bradesco
      def self.valid_account?(branch, account_number, account_digit)
        new(branch, account_number, account_digit).valid_account?
      end

      def initialize(branch, account_number, account_digit)
        @branch, @account_number, @account_digit = branch, account_number, account_digit
      end

      def valid_account?
        @account_digit.upcase == modulo11_2to7_p_as_1
      end

      private

      def modulo11_2to7_p_as_1
        value = modulo11_2to7
        case value
        when 0 then "0"
        when 1 then "P"
        else "#{11 - value}"
        end
      end

      def modulo11_2to7
        multiplier([2, 3, 4, 5, 6, 7]) % 11
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
