require "active_model"

class BankingDataValidator < ActiveModel::Validator
  autoload :BancoBase,      "banking_data_validator/banco_base"
  autoload :BancoBradesco,  "banking_data_validator/banco_bradesco"
  autoload :BancoDoBrasil,  "banking_data_validator/banco_do_brasil"
  autoload :BancoItau,      "banking_data_validator/banco_itau"
  autoload :BancoSantander, "banking_data_validator/banco_santander"

  def initialize(options = {})
    super
    @bank_number_field_name    = options.fetch(:bank_number, :bank_number)
    @branch_number_field_name  = options.fetch(:branch_number, :branch_number)
    @account_number_field_name = options.fetch(:account_number, :account_number)
    @account_digit_field_name  = options.fetch(:account_digit, :account_digit)
  end

  def validate(record)
    bank_number    = record.public_send(@bank_number_field_name)
    branch_number  = record.public_send(@branch_number_field_name)
    account_number = record.public_send(@account_number_field_name)
    account_digit  = record.public_send(@account_digit_field_name)

    bank = build_bank(bank_number)

    if !valid_number?(branch_number)
      record.errors.add(@branch_number_field_name, :not_a_number)
    end

    if !valid_number?(account_number)
      record.errors.add(@account_number_field_name, :not_a_number)
    elsif !bank.valid_account?(branch_number, account_number, account_digit)
      record.errors.add(@account_digit_field_name)
    end
  end

  private

  def valid_number?(number)
    number && integer?(number)
  end

  def integer?(string)
    Integer(string, 10) && true rescue false
  end

  def build_bank(number)
    {
      "237" => BancoBradesco.new,
      nil   => BancoBase.new,
    }[number]
  end
end
