class HomeController < ApplicationController
  def dashboard
    month = params[:month]
    year = params[:year]
    @date = Date.parse("#{year}/#{month}") if month && year
    @date = Date.today if !@date || @date.month == Date.today.month

    @categories = Category.all.by_transaction_count
    @transaction = Transaction.new(:date => @date)
    @transactions = Transaction.month(@date)
  end
end
