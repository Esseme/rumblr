require "rails_helper"

RSpec.describe "Guest visits the home page" do
  it "displays a list of articles created by all the users" do
    create :article, title: "TEST_ARTICLE_1"
    create :article, title: "TEST_ARTICLE_2"

    visit root_path

    expect(page).to have_content "TEST_ARTICLE_1"
    expect(page).to have_content "TEST_ARTICLE_2"
    expect(page).not_to have_content "Edit Article"
  end
  context "when guest clicks article title" do
    it "opens the article show page" do
      create :article, title: "TEST_ARTICLE_1", content: "My content"
      create :article, title: "TEST_ARTICLE_2", content: "Other content"

      visit root_path

      click_link("TEST_ARTICLE_1")

      expect(page).to have_content "TEST_ARTICLE_1"
      expect(page).to have_content "My content"
      expect(page).not_to have_content "TEST_ARTICEL_2"
      expect(page).not_to have_content "Other content"
    end

    it "shows the need to signin in order to comment" do
      create :article, title: "TEST_ARTICLE_1", content: "My content"

      visit root_path

      click_link("TEST_ARTICLE_1")

      expect(page).to have_content "Signin to add a comment"
      expect(page).to have_link "Signin to add a comment"
      expect(page).not_to have_content "Comments"
    end
  end

  context "when guest signs in" do
    it "displays the comment form" do
      article = create :article, title: "TEST_ARTICLE_1", content: "My content"

      user = create(:user)
      visit article_path(article, as: user)

      expect(page).to have_content "Comments"
      expect(page).not_to have_content "Signin to add a comment"
      expect(page).to have_field "comment_body"
    end
  end
end
