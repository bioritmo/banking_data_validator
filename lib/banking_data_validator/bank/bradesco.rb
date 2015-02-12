require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Bradesco < Base
      private

      def checksum
        case raw_checksum
        when 0 then "0"
        when 1 then "P"
        else "#{11 - raw_checksum}"
        end
      end

      def raw_checksum
        @raw_checksum ||= multiply_factors % 11
      end

      def factors
        @factors ||= [2, 3, 4, 5, 6, 7].cycle
      end
    end
  end
end
