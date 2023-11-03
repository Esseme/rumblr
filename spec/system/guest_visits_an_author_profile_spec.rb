require "rails_helper"

RSpec.describe "Guest visits an author profile" do
  it "displays a list of articles created by that author" do
    author = create(:user)

    create :article, user: author, title: "TEST_ARTICLE_1"
    create :article, user: author, title: "TEST_ARTICLE_2"
    create :article, title: "TEST_ARTICLE_3"

    visit user_path(author)

    expect(page).to have_content "TEST_ARTICLE_1"
    expect(page).to have_content "TEST_ARTICLE_2"
    expect(page).not_to have_content "TEST_ARTICLE_3"
    expect(page).not_to have_content "Edit Article"
  end
end
