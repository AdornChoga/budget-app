FactoryBot.define do
  factory :financial_transaction do
    name { 'MyString' }
    amount { 1 }
    user { nil }
  end
end
