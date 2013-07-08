class HomeController < ApplicationController
  def dashboard
    month = params[:month]
    year = params[:year]
    @date = Date.parse("#{year}/#{month}") if month && year
    @date = Date.today if !@date || @date.month == Date.today.month

    @categories = Category.all.by_expense_count
    @expense = Expense.new(:date => @date)
    @expenses_by_week = Expense.month(@date)
      .order('date desc')
      .all.group_by { |expense| expense.date.beginning_of_week }
  end
end
