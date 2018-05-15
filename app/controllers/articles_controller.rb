class ArticlesController < ApplicationController



 def index
    @articles = Article.all
  end

  def show
    # params returns a hash of parameters
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(article_params)
    redirect_to article_path(article)
  end

  def edit
    find_article
  end

  def update
    find_article
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    return params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end





end
