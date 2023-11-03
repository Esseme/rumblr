class ArticlePolicy
  def initialize(user, article)
    @article = article
    @user = user
  end

  def edit?
    @article.user == @user
  end
end
