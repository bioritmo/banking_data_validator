require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Itau < Base
      private

      def checksum
        "#{raw_checksum % 10}"
      end

      def raw_checksum
        10 - (multiply_factors % 10)
      end

      def multiply_factors
        digits.reverse.inject(0) do |total, digit|
          total + sum_digits(digit * factors.next)
        end
      end

      def digits
        "#{@branch}#{@account_number}".chars.map(&:to_i)
      end

      def sum_digits(number)
        number.to_s.chars.map(&:to_i).inject(0) do |total, digit|
          total + digit
        end
      end

      def factors
        @factors ||= [2, 1].cycle
      end
    end
  end
end
