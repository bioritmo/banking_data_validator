require "banking_data_validator/bank/itau"

module BankingDataValidator
  module Bank
    RSpec.describe BankingDataValidator::Bank::Itau do
      let(:attrs) { { bank_number: "341" } }

      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(described_class.valid_account?("0262", "42602", "6")).to eq(true)
          expect(described_class.valid_account?("1517", "15667", "3")).to eq(true)
          expect(described_class.valid_account?("2545", "02366", "1")).to eq(true)
          expect(described_class.valid_account?("8252", "09881", "2")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(described_class.valid_account?("0991", "87362", "0")).to eq(false)
        end
      end
    end
  end
end
