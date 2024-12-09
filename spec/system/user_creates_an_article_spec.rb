require "rails_helper"

RSpec.describe "User creates an article" do
  it "shows their amazing content" do
    user = create(:user)
    visit root_path(as: user)
    fill_in "Title", with: "This is my awesome title"
    fill_in "Content", with: "My awesome content"
    click_button "Submit"

    expect(page).to have_content "Article was successfully created"
    article = Article.last
    expect(article.user_id).to eq(user.id)
    expect(page).to have_content article.title
    expect(page).to have_content article.content
  end

  context "user tries to edit somebody else's article" do
    it "shows an 'unauthorized' error" do
      article = create :article
      other_author = create :user

      visit edit_article_path article, as: other_author

      expect(page).to have_content "You cannot edit this article."
    end
  end

  context "user provides wrong form data" do
    it "shows an error on the form" do
      user = create(:user)
      visit root_path(as: user)

      click_button "Submit"

      expect(page).to have_content "New article"
      expect(page).to have_content "2 errors prohibited this article from being saved"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Content can't be blank"
    end
  end

  it "displays the article's timestamp in the correct format" do
    user = create(:user)
    visit root_path(as: user)
    fill_in "Title", with: "This is my awesome title"
    fill_in "Content", with: "My awesome content"
    click_button "Submit"

    article = Article.last
    expect(page).to have_content article.created_at.strftime("%B %d, %Y")
  end
end
