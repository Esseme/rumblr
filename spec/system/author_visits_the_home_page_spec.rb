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
end
