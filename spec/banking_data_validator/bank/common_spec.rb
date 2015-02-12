require "banking_data_validator/bank/common"

module BankingDataValidator
  module Bank
    RSpec.describe Common do
      describe "#valid_account?" do
        it "always returns true" do
          expect(Common.valid_account?(nil, "15007", "x")).to eq(true)
          expect(Common.valid_account?(nil, "71000", "8")).to eq(true)
          expect(Common.valid_account?(nil, "23433", "0")).to eq(true)
          expect(Common.valid_account?(nil, "87362", "0")).to eq(true)
        end
      end
    end
  end
end
