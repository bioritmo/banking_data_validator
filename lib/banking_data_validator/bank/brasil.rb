require "banking_data_validator/bank/base"

module BankingDataValidator
  module Bank
    class Brasil < Base
      private

      def checksum
        case raw_checksum
        when 10 then "X"
        else "#{raw_checksum}"
        end
      end

      def raw_checksum
        @raw_checksum ||= multiply_factors % 11
      end

      def factors
        @factors ||= (2..9).reverse_each.cycle
      end
    end
  end
end
