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
    @expense = Expense.build_with_defaults(expense_params_with_category)
    flash[:notice] = 'Expense was successfully created.' if @expense.save
    respond_with @expense do |format|
      format.html { redirect_to root_path }
    end
  end

  def update
    if @expense.update_with_defaults(expense_params_with_category)
      flash[:notice] = 'Expense was successfully updated.'
    end
    respond_with @expense do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @expense.destroy
    flash[:notice] = "Successfully destroyed expense"
    respond_with @expense do |format|
      format.html { redirect_to root_path }
    end
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params_with_category
      params.permit(
        :expense  => [:date, :amount, :description],
        :category => [:name]
      )
    end
end
