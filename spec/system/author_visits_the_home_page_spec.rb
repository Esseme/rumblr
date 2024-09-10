require "rails_helper"

RSpec.describe "Author visits the home page" do
  it "shows a form for creating a new article" do
    user = create :user

    visit root_path as: user

    expect(page).to have_content "New article"
  end
  context "author comments on their own article" do
    it "displays their comment" do
      user = create(:user)
      article = create(
        :article,
        content: "My awesome content",
        title: "This is my awesome title",
        user: user
      )

      visit article_path(article, as: user)
      fill_in "comment_body", with: "This is a sample comment"
      click_button "Submit"

      within(".comments") do
        expect(page).to have_content user.name
        expect(page).to have_content "This is a sample comment"
      end
    end
  end
  context "author enters no comment and sumbits" do
    it "shows an error" do
      user = create(:user)
      article = create(
        :article,
        content: "My awesome content",
        title: "This is my awesome title",
        user: user
      )

      visit article_path(article, as: user)

      fill_in "comment_body", with: ""
      click_button "Submit"

      expect(page).to have_content "Comment can't be blank"
    end
  end

  context "author edits the comment on their own article" do
    it "shows their editted comment" do
      user = create(:user)
      article = create(
        :article,
        content: "My awesome content",
        title: "This is my awesome title",
        user: user
      )

      visit article_path(article, as: user)
      fill_in "comment_body", with: "This is a sample comment"
      click_button "Submit"
      visit article_path(article, as: user)
      within(".comments") do
        click_link "Edit"
      end
      fill_in "comment_body", with: "This is an editted comment"
      click_button "Submit"

      within(".comments") do
        expect(page).to have_content user.name
        expect(page).to have_content "This is an editted comment"
      end
    end
  end

  context "author isn't the one who posted the comment" do
    it "shouldn't show the edit link" do
      user = create(:user)
      other_user = create(:user)
      article = create(
        :article,
        content: "My awesome content",
        title: "This is my awesome title",
        user: user
      )

      visit article_path(article, as: user)
      fill_in "comment_body", with: "This is a sample comment"
      click_button "Submit"

      visit article_path(article, as: other_user)
      within(".comments") do
        expect(page).not_to have_link "Edit"
      end
    end
  end
end
