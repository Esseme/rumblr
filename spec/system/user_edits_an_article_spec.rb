require "rails_helper"

RSpec.describe "User edits an article" do
  it "shows an edit button on the article show page" do
    user = create(:user)
    article = create(
      :article,
      content: "My awesome content",
      title: "This is my awesome title",
      user: user
    )

    visit root_path(as: user)
    click_button "Submit"
    visit article_path(as: user, id: article.id)

    expect(page).to have_selector(:link_or_button, "Edit")
  end

  context "user clicks edit button" do
    it "shows the edited article" do
      user = create(:user)
      article = create(
        :article,
        content: "My awesome content",
        title: "This is my awesome title",
        user: user
      )

      visit edit_article_path(as: user, id: article.id)
      fill_in "Title", with: "This is my edited awesome title"
      fill_in "Content", with: "My edited awesome content"
      click_button "Submit"

      expect(page).to have_content "Article was successfully edited"
      expect(page).to have_content "This is my edited awesome title"
      expect(page).to have_content "My edited awesome content"
    end

    it "shows the unedited article with a flash" do
      user = create(:user)
      article = create(
        :article,
        content: "My wawsome content",
        title: "This is my awesome title",
        user: user
      )

      visit edit_article_path(article, as: user)
      click_button "Submit"

      expect(page).to have_content "No changes were made to the article"
      expect(page).to have_content "This is my awesome title"
      expect(page).to have_content "My wawsome content"
    end
  end
end
