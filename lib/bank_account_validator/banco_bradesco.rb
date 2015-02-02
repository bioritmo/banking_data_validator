class BankAccountValidator
  class BancoBradesco < BancoBase
    def valid_account?(branch, account_number, account_digit)
      account_digit.upcase == modulo11_2to7_p_as_1(account_number)
    end

    private

    def modulo11_2to7_p_as_1(string)
      value = modulo11_2to7(string)
      case value
      when 0 then "0"
      when 1 then "P"
      else "#{11 - value}"
      end
    end

    def modulo11_2to7(string)
      multiplier([2, 3, 4, 5, 6, 7], string) % 11
    end
  end
end
