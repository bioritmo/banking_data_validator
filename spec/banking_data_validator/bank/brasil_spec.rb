require "banking_data_validator/bank/brasil"

module BankingDataValidator
  module Bank
    RSpec.describe Brasil do
      describe "#valid_account?" do
        it "returns true when is given an account_number with a valid digit" do
          expect(Brasil.valid_account?(nil, "65005", "6")).to eq(true)
          expect(Brasil.valid_account?(nil, "22029", "9")).to eq(true)
          expect(Brasil.valid_account?(nil, "70000", "2")).to eq(true)
          expect(Brasil.valid_account?(nil, "7107", "2")).to eq(true)
          expect(Brasil.valid_account?(nil, "80000", "7")).to eq(true)
          expect(Brasil.valid_account?(nil, "8354", "2")).to eq(true)
          expect(Brasil.valid_account?(nil, "15007", "X")).to eq(true)
          expect(Brasil.valid_account?(nil, "15007", "x")).to eq(true)
        end

        it "returns false when is given an account_number with an invalid digit" do
          expect(Brasil.valid_account?(nil, "23433", "0")).to eq(false)
          expect(Brasil.valid_account?(nil, "23433", "P")).to eq(false)
          expect(Brasil.valid_account?(nil, "23433", "10")).to eq(false)
          expect(Brasil.valid_account?(nil, "15007", "xx")).to eq(false)
          expect(Brasil.valid_account?(nil, "15007", "10")).to eq(false)
        end
      end
    end
  end
end

