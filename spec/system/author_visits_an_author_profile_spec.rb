require "rails_helper"

RSpec.describe "Author visits an author profile" do
  context "the profile belongs to the author" do
    it "shows an edit link" do
      author = create(:user)
      create :article, user: author

      visit user_path(author, as: author)

      expect(page).to have_content "Edit Article"
    end
  end
  context "the profile doesn't belong to the author" do
    it "doesn't show an edit link" do
      author = create(:user)
      somebody_else = create(:user)
      create :article, user: somebody_else

      visit user_path(somebody_else, as: author)

      expect(page).not_to have_content "Edit Article"
    end
  end
end
