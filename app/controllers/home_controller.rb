class HomeController < ApplicationController
  def dashboard
    @transaction = Transaction.new
    @transactions = Transaction.recent
  end
end
