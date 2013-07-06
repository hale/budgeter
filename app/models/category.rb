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
    expenses.month(date).map(&:amount).reduce(&:+) || Money.new(0)
  end

  def remaining(date = Date.today)
    spend(date) ? budget - spend(date) : budget
  end

  def projected_spend(date = Date.today)
    days_in_month = Time.days_in_month(date.month, date.year)
    spend(date) * days_in_month / date.day
  end

  def projected_remaining(date = Date.today)
    projected_spend(date) - spend
  end

  def projected_difference(date = Date.today)
    projected_remaining(date) - remaining(date)
  end

end
