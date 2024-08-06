class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  ACCOUNT_TYPES = { 'savings' => 'Ahorros', 'current' => 'Cuenta Corriente Empresarial' }

  validates :account_type, inclusion: { in: ACCOUNT_TYPES.keys }
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :origin_city, presence: true

  def deposit(amount)
    self.with_lock do
      self.balance += amount
      save!
      transactions.create!(transaction_type: 'deposit', amount: amount, location: 'Local')
    end
  end

  def withdraw(amount, location)
    self.with_lock do
      raise "Insufficient balance" if balance < amount
      self.balance -= amount
      save!
      transactions.create!(transaction_type: 'withdrawal', amount: amount, location: location)
    end
  end

  def recent_movements
    transactions.order(created_at: :desc).limit(10)
  end

  def current_balance
    balance
  end

  def account_type_name
    ACCOUNT_TYPES[account_type]
  end
end
