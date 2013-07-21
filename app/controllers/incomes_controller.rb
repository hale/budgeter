class IncomesController < ApplicationController
  respond_to :html
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  def index
    @incomes = Income.all
  end

  def show
  end

  def new
    @income = Income.new
  end

  def edit
  end

  def create
    @income = Income.new(income_params)
    flash[:notice] = 'Income was successfully created.' if @income.save
    respond_with @income
  end

  def update
    if @income.update(income_params)
      flash[:notice] = 'Income was successfully updated.'
    end
    respond_with @income
  end

  def destroy
    @income.destroy
    respond_with @income
  end

  private
    def set_income
      @income = Income.find(params[:id])
    end

    def income_params
      params.require(:income).permit(:amount, :name, :date)
    end
end
