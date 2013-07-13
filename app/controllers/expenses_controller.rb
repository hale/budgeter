class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @expenses = Expense.all
    @expense = Expense.new
  end

  def show
  end

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.date = Date.parse(params[:expense][:date]) if @expense.date.nil?
    @expense.category = Category.find_or_initialize_by_name(params[:category][:name])
    flash[:notice] = 'Expense was successfully created.' if @expense.save
    respond_with @expense
  end

  def update
    date_category = {
      :date => Date.parse(params[:expense][:date]),
      :category => Category.find_or_initialize_by_name(params[:category][:name])
    }
    if @expense.update(expense_params.merge(date_category))
      flash[:notice] = 'Expense was successfully updated.'
    end
    respond_with @expense
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Successfully destroyed expense"
    respond_with @expense
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:date, :amount, :description)
    end
end
