require "banking_data_validator/bank/hsbc"

module BankingDataValidator
  module Bank
    RSpec.describe HSBC do
      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(HSBC.valid_account?(7, "853838", "6")).to eq(true)
          expect(HSBC.valid_account?("1823", "023467", "7")).to eq(true)
          expect(HSBC.valid_account?("0336", "006625", "3")).to eq(true)
          expect(HSBC.valid_account?(885, "008468", "2")).to eq(true)
          expect(HSBC.valid_account?(7, "85383", "86")).to eq(true)
          expect(HSBC.valid_account?("0336", "00662", "53")).to eq(true)
          expect(HSBC.valid_account?("1823", "02346", "77")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(HSBC.valid_account?("0007", "853838", "9")).to eq(false)
          expect(HSBC.valid_account?("1823", "023467", "9")).to eq(false)
          expect(HSBC.valid_account?("0336", "006625", "9")).to eq(false)
          expect(HSBC.valid_account?("0885", "008468", "9")).to eq(false)
          expect(HSBC.valid_account?("0336", "00662", "59")).to eq(false)
          expect(HSBC.valid_account?("0885", "00846", "89")).to eq(false)
          expect(HSBC.valid_account?("0885", "008468", "99")).to eq(false)
        end
      end
    end
  end
end
