RSpec.describe BankingDataValidator::BancoItau do
  describe "#valid_account?" do
    it "valid account digits" do
      expect(subject).to be_valid_account("0262", "42602", "6")
      expect(subject).to be_valid_account("1517", "15667", "3")
      expect(subject).to be_valid_account("2545", "02366", "1")
    end

    it "invalid account digits" do
      expect(subject).to_not be_valid_account("0991", "87362", "0")
    end
  end
end
