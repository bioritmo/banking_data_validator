# BankingDataValidator

[![Build Status](https://semaphoreapp.com/api/v1/projects/94783b1d-8994-47d8-b971-d1812dd31d40/339766/shields_badge.svg)](https://semaphoreapp.com/aduarte/banking_data_validator)
[![Code Climate](https://codeclimate.com/github/americodls/banking_data_validator/badges/gpa.svg)](https://codeclimate.com/github/americodls/banking_data_validator)
[![Test Coverage](https://codeclimate.com/github/americodls/banking_data_validator/badges/coverage.svg)](https://codeclimate.com/github/americodls/banking_data_validator)
[![Dependency Status](https://gemnasium.com/americodls/banking_data_validator.svg)](https://gemnasium.com/americodls/banking_data_validator)
[![security](https://hakiri.io/github/americodls/banking_data_validator/master.svg)](https://hakiri.io/github/americodls/banking_data_validator/master)
[![Inline docs](http://inch-ci.org/github/americodls/banking_data_validator.svg?branch=master&style=shields)](http://inch-ci.org/github/americodls/banking_data_validator)

An implementation of ActiveModel::Validator for bank accounts.

## Installation

Add this line to your application"s Gemfile:

```ruby
gem "banking_data_validator"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banking_data_validator

## Usage

Just call `validates_with BankingDataValidator::Validator`.

```ruby
class Payment
  # include ActiveModel::Model
  # attr_accessor :bank_number, :branch_number, :account_number, :account_digit
  
  validates_with BankingDataValidator::Validator
end
```

But if your attribute names are different of our default names you can pass your custom names.

```ruby
class CustomPayment
  # include ActiveModel::Model
  # attr_accessor :c_bank, :c_branch, :c_account, :c_digit
  
  validates_with  BankingDataValidator::Validator,
                  bank_number:    :c_bank,
                  branch_number:  :c_branch,
                  account_number: :c_account,
                  account_digit:  :c_digit
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/banking_data_validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
