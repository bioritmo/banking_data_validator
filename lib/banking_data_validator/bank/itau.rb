require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Itau < Base
      def valid_account?
        @account_digit == module10
      end

      private

      def module10
        total = 0
        multiplier = 2

        "#{@branch}#{@account_number}".split(//).reverse!.each do |char|
          total += sum_digits(char.to_i * multiplier)
          multiplier = multiplier == 2 ? 1 : 2
        end

        value = (10 - (total % 10))
        value == 10 ? "0" : "#{value}"
      end

      def sum_digits(str)
        initial_value = str.kind_of?(Fixnum) ? str : str.to_i
        return 0 if initial_value == 0
        return initial_value if initial_value <= 9

        initial_value = initial_value.to_s
        total = 0

        0.upto(initial_value.size-1) {|digit| total += initial_value[digit, 1].to_i }

        return total
      end
    end
  end
end