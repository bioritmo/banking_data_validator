class BankingDataValidator
  class BancoSantander < BancoBase
    def valid_account?(branch, account_number, account_digit)
      account_digit.upcase == module10_santander("#{branch}#{account_number}").to_s
    end

    private

    def module10_santander(account_number)
      factors = [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3].cycle

      total = account_number.chars.map(&:to_i).inject(0) do |acc, digito|
        acc + (digito * factors.next % 10)
      end

      10 - total % 10
    end
  end
end
