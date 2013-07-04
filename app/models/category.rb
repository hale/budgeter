class Category < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  monetize :budget_pennies, :numericality => { :greater_than => 0 }

  has_many :expenses

  scope :by_expense_count, ->{
    joins('left join expenses on expenses.category_id = categories.id')
    .select('categories.*, count(expenses.id) as expenses_count')
    .group('categories.id')
    .order('expenses_count desc')
  }

  def spend(date=Date.today)
    expenses.month(date).map(&:amount).reduce(&:+)
  end

  def remaining(date = Date.today)
    spend(date) ? budget - spend(date) : budget
  end

end
