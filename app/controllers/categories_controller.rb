class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @categories = Category.by_expense_count
  end

  def show
    @expenses = @category.expenses
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with @category
  end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category was successfully updated.'
    end
    respond_with @category
  end

  def destroy
    @category.destroy
    respond_with @category
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :budget)
    end
end
