class Transaction < ApplicationRecord
  belongs_to :account

  TRANSACTION_TYPES = { 'deposit' => 'Deposito', 'withdrawal' => 'Retiro' }

  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES.keys }
  validates :amount, numericality: { greater_than: 0 }

  def deposit?
    transaction_type == 'deposit'
  end

  def withdraw?
    transaction_type == 'withdrawal'
  end

  def transaction_type_name
    TRANSACTION_TYPES[transaction_type]
  end
end
