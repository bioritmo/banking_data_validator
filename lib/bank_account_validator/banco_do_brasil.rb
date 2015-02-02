class BankAccountValidator
  class BancoDoBrasil < BancoBase
    def valid_account?(branch, account_number, account_digit)
      account_digit.upcase == module11_9to2_10_as_x(account_number).to_s
    end

    private

    def module11_9to2_10_as_x(string)
      value = module11_9to2(string)
      case value
      when 10 then "X"
      else value
      end
    end

    def module11_9to2(string)
      multiplier([9, 8, 7, 6, 5, 4, 3, 2], string) % 11
    end
  end
end
