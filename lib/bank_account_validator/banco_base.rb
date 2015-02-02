class BankingDataValidator
  class BancoBase
    def valid_account?(branch, account_number, account_digit)
      true
    end

    private

    def multiplier(factors, string)
      multiplier_position = factors.cycle

      string.chars.map(&:to_i).reverse.inject(0) do |total, algarism|
        total + algarism * multiplier_position.next
      end
    end
  end
end
