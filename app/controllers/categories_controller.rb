class CategoriesController < ApplicationController
def index
  @categories = Category.all.sort_by &:created_at
end

def show
  @category = Category.find(params[:id])
end

def new
  @category = Category.new(params[:id])
end

def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to @category
  else
    @errors = "Invalid category."
  end
end

def edit
  @category = Category.find(params[:id])
end

def update
  @category = Category.find(params[:id])
  if @category.update(category_params)
    redirect_to @category
  else
    @errors = "Try again. Now."
  end
end

def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to categories_path
end

private

  def category_params
    params.require(:category).permit(:title)
  end


end
