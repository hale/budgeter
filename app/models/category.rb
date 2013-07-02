class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  monetize :budget_pennies, :numericality => { :greater_than => 0 }

  has_many :transactions

  scope :by_transaction_count, ->{
    joins('left join transactions on transactions.category_id = categories.id')
    .select('categories.*, count(transactions.id) as transactions_count')
    .group('categories.id')
    .order('transactions_count desc')
  }

  def spend(date=Date.today)
    transactions.month(date).map(&:amount).reduce(&:+)
  end

  def remaining(date = Date.today)
    spend(date) ? budget - spend(date) : budget
  end

end
