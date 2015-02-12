require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Brasil < Base
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
    end
  end
end
