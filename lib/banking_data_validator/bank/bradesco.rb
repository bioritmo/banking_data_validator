require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Bradesco < Base
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
    end
  end
end
