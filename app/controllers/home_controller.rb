class HomeController < ApplicationController
  def dashboard
    month = params[:month]
    year = params[:year]
    @date = (month && year) ? Date.parse("#{month}/#{year}") : Date.today
    @transaction = Transaction.new(:date => @date)
    @transactions = Transaction.month(@date)
    @categories = Category.all
  end
end
