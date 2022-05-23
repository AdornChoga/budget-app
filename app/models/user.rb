class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :financial_transactions, dependent: :destroy
  validates :name, presence: true
end
