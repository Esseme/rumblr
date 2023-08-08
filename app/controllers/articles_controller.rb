class ArticlesController < ApplicationController
  skip_before_action :require_login, only: [:show]

  def index
    @articles = current_user.articles.order(created_at: :asc)
  end

  def new
    @article = current_user.articles.build
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
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])

    unless @article.user == current_user
      flash[:alert] = t(".cannot_edit")
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      if @article.previously_changed?
        redirect_to @article, notice: t(".no_edit")
      else
        redirect_to @article, notice: t(".success")
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
