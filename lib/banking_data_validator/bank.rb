require "banking_data_validator/bank/brasil"
require "banking_data_validator/bank/santander"
require "banking_data_validator/bank/caixa"
require "banking_data_validator/bank/bradesco"
require "banking_data_validator/bank/itau"
require "banking_data_validator/bank/hsbc"
require "banking_data_validator/bank/common"

module BankingDataValidator
  module Bank
    def self.build_class(bank_number)
      case bank_number
      when "001" then Brasil
      when "033" then Santander
      when "104" then Caixa
      when "237" then Bradesco
      when "341" then Itau
      when "399" then HSBC
      else Common
      end
    end
  end
end
