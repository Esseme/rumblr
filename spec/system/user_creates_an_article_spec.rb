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
    expect(page).to have_content "Article ##{article.id}"
    expect(page).to have_content article.title
    expect(page).to have_content article.content
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
end
