class CommentsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.article, notice: t(".success")
    else
      flash[:alert] = t(".cannot_create")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
