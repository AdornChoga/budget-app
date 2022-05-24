class CategoriesController < ApplicationController
  before_action :create_category, only: [:create]

  def index; end

  def new
    @category = Category.new
  end

  def create
    @category.user = current_user
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to root_path
    else
      flash[:alert] = @category.errors.first.full_message.to_s if @category.errors.any?
      redirect_to new_category_path
    end
  end

  protected

  def create_category
    @category = Category.create(category_params)
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
