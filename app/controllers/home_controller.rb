class HomeController < ApplicationController
  before_filter :set_tab

  def dashboard
    month = params[:month]
    year = params[:year]
    @date = Date.parse("#{year}/#{month}") if month && year
    @date = Date.today if !@date || @date.month == Date.today.month

    @categories = Category.all.by_expense_count
    @expense = Expense.new(:date => @date)
    @expenses_by_week = Expense.by_week(@date)
  end

  private

  def set_tab
    current_tab = params[:tab] if params[:tab]
  end
end
