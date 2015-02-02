RSpec.describe BankingDataValidator::BancoSantander do
  describe "#valid_account?" do
    it "valid account digits" do
      expect(subject).to be_valid_account("0189", "01017417", "9")
      expect(subject).to be_valid_account("3140", "13000470", "9")
      expect(subject).to be_valid_account("1227", "43000005", "2")
    end

    it "invalid account digits" do
      expect(subject).to_not be_valid_account("0991", "01387362", "0")
    end
  end
end
