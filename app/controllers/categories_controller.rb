class CategoriesController < ApplicationController
  before_action :create_category, only: [:create]

  def index
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    default_icon = 'https://icon2.cleanpng.com/20180216/gaw/kisspng-question-mark-clip-art-question-mark-images-5a87a71b595fd8.4163604515188395793661.jpg'
    @category.icon = default_icon if params[:category][:icon].blank?
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
