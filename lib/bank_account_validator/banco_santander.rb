class BankAccountValidator
  class BancoSantander < BancoBase
    def valid_account?(branch, account_number, account_digit)
      account_digit.upcase == module10_santander("#{branch}#{account_number}").to_s
    end

    private

    def module10_santander(str)
      valor_inicial = str.kind_of?(String) ? str : str.to_s
      fatores = [9, 7, 3, 1, 9, 7, 1, 3, 1, 9, 7, 3]
      total = 0
      posicao = 0
      valor_inicial.split(//).each do |digito|
        total += (digito.to_i * fatores[posicao]).to_s.split(//)[-1].to_i
        posicao = (posicao < (fatores.size - 1)) ? (posicao + 1) : 0
      end
      dv = 10 - total.to_s.split(//)[-1].to_i
      dv == 10 ? 0 : dv
    end
  end
end
