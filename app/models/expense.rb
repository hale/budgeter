class Expense < ActiveRecord::Base
  validates_presence_of :category, :date, :amount
  belongs_to :category
  accepts_nested_attributes_for :category

  scope :recent,
    ->       { since(7.days.ago).limit(10) }
  scope :since,
    ->(date) { where('date > ?', date) }
  scope :month,
    ->(date) { where(:date => date.beginning_of_month..date.end_of_month) }
  scope :category,
    ->(name) { where('categories.name = ?', name).joins(:category) }

  register_currency :gbp
  monetize :amount_pennies, :numericality => { :greater_than => 0 }

  def self.build_with_defaults(params)
    expense = new(params[:expense])
    expense.date = Date.parse(params[:expense][:date]) if expense.date.nil?
    expense.category = Category.find_or_initialize_by_name(
      params[:category][:name]
    )
    expense
  end

  def update_with_defaults(params)
    expense_params = params[:expense]
    expense_params.merge!({
      :date => Date.parse(params[:expense][:date]),
      :category => Category.find_or_initialize_by_name(params[:category][:name])
    })
    update(expense_params)
  end

  def new_or_existing_category
    category || build_category
  end

  def self.by_week(date=Date.today)
    month(date).order('date DESC').all.group_by do |expense|
      expense.date.beginning_of_week
    end
  end


end
