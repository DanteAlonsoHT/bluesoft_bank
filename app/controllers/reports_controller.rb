class ReportsController < ApplicationController
  def transactions_by_month
    @month = params[:month].to_i
    @transactions_by_user = User.joins(accounts: :transactions)
                                .where("EXTRACT(MONTH FROM transactions.created_at) = ?", @month)
                                .group('users.id')
                                .select('users.*, COUNT(transactions.id) as transactions_count')
                                .order('transactions_count DESC')
  end

  def withdrawals_outside_city
    @users_with_large_withdrawals = User.joins(accounts: :transactions)
                                .where('transactions.transaction_type = ?', 'withdrawal')
                                .where('transactions.location != accounts.origin_city')
                                .group('users.id')
                                .having('SUM(transactions.amount) > ?', 1_000_000)
                                .select('users.*, SUM(transactions.amount) as total_withdrawals')
                                .order('total_withdrawals DESC')
  end
end
