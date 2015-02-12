require "banking_data_validator/bank/caixa"

module BankingDataValidator
  module Bank
    RSpec.describe Caixa do
      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(Caixa.valid_account?("2004", "00100000448", "6")).to eq(true)
          expect(Caixa.valid_account?("1314", "01300169300", "1")).to eq(true)
          expect(Caixa.valid_account?("0268", "00100030339", "5")).to eq(true)
          expect(Caixa.valid_account?("3498", "00100021718", "8")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(described_class.valid_account?("1234", "56789012345", "6")).to eq(false)
        end
      end
    end
  end
end
