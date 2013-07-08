class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @expense.save
        format.html { redirect_to :back, notice: 'Expense was successfully created.' }
        format.json { render action: 'show', status: :created, location: @expense }
      else
        format.html { render action: 'new' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    date_category = {
      :date => Date.parse(params[:expense][:date]),
      :category => Category.find_or_initialize_by_name(params[:category][:name])
    }

    respond_to do |format|
      if @expense.update(expense_params.merge(date_category))
        format.html { redirect_to @expense, notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_path }
      format.json { head :no_content }
    end
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:date, :amount, :description)
    end
end
