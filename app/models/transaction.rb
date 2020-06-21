class Transaction < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: true
  validates :transaction_type, presence: true, inclusion: { in: ['withdraw', 'deposit']}
end
