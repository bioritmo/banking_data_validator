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
        @raw_checksum ||= multiplier([9, 8, 7, 6, 5, 4, 3, 2]) % 11
      end
    end
  end
end
