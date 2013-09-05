class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

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

    respond_with @expense do |format|
      if @expense.save
        flash[:notice] = 'Expense was successfully created.'
        format.json do
          render :json => { :location => root_path }, :status => 302
        end
      else
        format.json do
          render :json => { :errors => @expense.errors }, :status => 422
        end
      end
    end
  end

  def update
    respond_with @expense do |format|
      if @expense.update_with_defaults(expense_params_with_category)
        flash[:notice] = 'Expense was successfully updated.'
        format.json do
          render :json => { :location => root_path }, :status => 302
        end
      else
        format.json do
          render :json => { :errors => @expense.errors }, :status => 422
        end
      end
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
