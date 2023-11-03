require "rails_helper"
RSpec.describe ArticlePolicy do
  describe "#edit?" do
    it "is false" do
      user = create(:user)
      other_user = create(:user)
      article = create :article, user: other_user
      article_policy = ArticlePolicy.new(user, article)

      expect(article_policy.edit?).to be false
    end

    context "when the user is the author" do
      it "is true" do
        user = create(:user)
        article = create :article, user: user
        article_policy = ArticlePolicy.new(user, article)

        expect(article_policy.edit?).to be true
      end
    end
  end
end
