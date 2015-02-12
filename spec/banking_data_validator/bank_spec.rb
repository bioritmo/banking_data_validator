require "banking_data_validator/bank"

module BankingDataValidator
  RSpec.describe Bank do
    describe ".build" do
      it "return an bank instance based on the given bank_number" do
        expect(Bank.build_class("001")).to eq(Bank::Brasil)
        expect(Bank.build_class("033")).to eq(Bank::Santander)
        expect(Bank.build_class("104")).to eq(Bank::Caixa)
        expect(Bank.build_class("237")).to eq(Bank::Bradesco)
        expect(Bank.build_class("341")).to eq(Bank::Itau)
        expect(Bank.build_class("399")).to eq(Bank::HSBC)
        expect(Bank.build_class("nil")).to eq(Bank::Common)
      end
    end
  end
end
