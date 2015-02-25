require "banking_data_validator/bank/bradesco"

module BankingDataValidator
  module Bank
    RSpec.describe Bradesco do
      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(Bradesco.valid_account?(nil, 238069, "2")).to eq(true)
          expect(Bradesco.valid_account?(nil, 160000, "1")).to eq(true)
          expect(Bradesco.valid_account?(nil, "87087", "0")).to eq(true)
          expect(Bradesco.valid_account?(nil, "71000", "8")).to eq(true)
          expect(Bradesco.valid_account?(nil, "3257", "3")).to eq(true)
          expect(Bradesco.valid_account?(nil, 121, "p")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(Bradesco.valid_account?(nil, "87362", "0")).to eq(false)
        end
      end
    end
  end
end
