require "banking_data_validator/bank/santander"

module BankingDataValidator
  module Bank
    RSpec.describe Santander do
      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(Santander.valid_account?(189, "01017417", "9")).to eq(true)
          expect(Santander.valid_account?("3140", "13000470", "9")).to eq(true)
          expect(Santander.valid_account?("1227", "43000005", "2")).to eq(true)
          expect(Santander.valid_account?("2258", "1005167", "1")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(Santander.valid_account?("0991", "01387362", "0")).to eq(false)
        end
      end
    end
  end
end
