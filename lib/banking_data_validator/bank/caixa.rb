require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Caixa < Base
      private

      def checksum
        "#{raw_checksum % 11}"
      end

      def raw_checksum
        @raw_checksum ||= multiply_factors * 10
      end

      def factors
        @factors ||= (2..9).cycle
      end

      def digits
        "#{@branch}#{@account_number}".chars.map(&:to_i)
      end
    end
  end
end
