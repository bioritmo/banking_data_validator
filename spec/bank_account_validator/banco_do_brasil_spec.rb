RSpec.describe BankAccountValidator::BancoDoBrasil do
  describe "#valid_account?" do
    it "valid account digits" do
      expect(subject).to be_valid_account(nil, "65005", "6")
      expect(subject).to be_valid_account(nil, "22029", "9")
      expect(subject).to be_valid_account(nil, "70000", "2")
      expect(subject).to be_valid_account(nil, "7107" , "2")
      expect(subject).to be_valid_account(nil, "80000", "7")
      expect(subject).to be_valid_account(nil, "8354" , "2")
      expect(subject).to be_valid_account(nil, "15007", "X")
      expect(subject).to be_valid_account(nil, "15007", "x")
    end

    it "invalid account digits" do
      expect(subject).to_not be_valid_account(nil, "23433", "0")
      expect(subject).to_not be_valid_account(nil, "23433", "P")
      expect(subject).to_not be_valid_account(nil, "23433", "10")
      expect(subject).to_not be_valid_account(nil, "15007", "xx")
      expect(subject).to_not be_valid_account(nil, "15007", "10")
    end
  end
end
