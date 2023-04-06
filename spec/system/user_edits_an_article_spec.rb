require "rails_helper"

RSpec.describe "User edits an article" do
  it "shows an edit button on the article show page" do
    user = create(:user)
    visit root_path(as: user)
    fill_in "Title", with: "This is my awesome title"
    fill_in "Content", with: "My awesome content"
    click_button "Submit"
    article = Article.last
    visit article_path(as: user, id: article.id)

    expect(page).to have_selector(:link_or_button, "Edit")
  end

  context "user clicks edit button" do
    it "shows the edited article" do
      user = create(:user)
      visit root_path(as: user)
      fill_in "Title", with: "This is my awesome title"
      fill_in "Content", with: "My awesome content"
      click_button "Submit"
      article = Article.last
      visit edit_article_path(as: user, id: article.id)
      fill_in "Title", with: "This is my edited awesome title"
      fill_in "Content", with: "My edited awesome content"
      click_button "Submit"

      expect(page).to have_content "Article was successfully edited"
      edited_article = Article.last
      expect(page).to have_content "Article ##{edited_article.id}"
      expect(page).to have_content edited_article.title
      expect(page).to have_content edited_article.content
    end

    xit "shows the unedited article with a flash" do
      user = create(:user)
      visit root_path(as: user)
      fill_in "Title", with: "This is my awesome title"
      fill_in "Content", with: "My awesome content"
      click_button "Submit"
      article = Article.last
      visit edit_article_path(as: user, id: article.id)
      click_button "Submit"

      expect(page).to have_content "No changes were made to the article"
      expect(page).to have_content "Article ##{article.id}"
      expect(page).to have_content article.title
      expect(page).to have_content article.content
    end
  end
end
