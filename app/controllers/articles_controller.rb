class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]

  def index
    @articles = current_user.articles.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article, notice: t(".success")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      if @article.previous_changes.empty?
        redirect_to @article, notice: t(".no_edit")
      else
        redirect_to @article, notice: t(".success")
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = current_user.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
