FactoryBot.define do
  factory :financial_transaction do
    name { 'MyString' }
    amount { '9.99' }
    user { nil }
  end
end
