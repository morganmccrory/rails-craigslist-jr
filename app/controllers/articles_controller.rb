class ArticlesController < ApplicationController
def index
  @articles = Article.all.sort_by &:created_at
end

def show
  @article = Article.find(params[:id])
end

def new
  @article = Article.new(params[:id])
  @category = Category.find(params[:category_id])
end

def create
  @category = Category.find(params[:category_id])
  @article = @category.articles.new(article_params)
  if @article.save
    redirect_to category_article_path(@category, @article)
  else
    @errors = "Invalid article."
  end
end

def edit
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  if @article.update(article_params)
    redirect_to category_article_path(@article.category, @article)
  else
    @errors = "Try again. Now."
  end
end

def destroy
  @category = Category.find(params[:category_id])
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to category_path(@category)
end

private

  def article_params
    params.require(:article).permit(:title, :description, :price, :email)
  end
end
