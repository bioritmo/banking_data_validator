RSpec.describe BankingDataValidator::BancoBradesco do
  describe "#valid_account?" do
    it "is true when the given account data is valid" do
      expect(subject).to be_valid_account(nil, "0238069", "2")
      expect(subject).to be_valid_account(nil, "160000", "1")
      expect(subject).to be_valid_account(nil, "87087", "0")
      expect(subject).to be_valid_account(nil, "71000", "8")
      expect(subject).to be_valid_account(nil, "3257", "3")
      expect(subject).to be_valid_account(nil, "121", "p")
    end

    it "is false when the given account data is not valid" do
      expect(subject).to_not be_valid_account(nil, "87362", "0")
    end
  end
end
