require "rails_helper"

RSpec.describe "User views their articles" do
  it "displays a list of articles created by the user" do
    user = create(:user)
    visit root_path(as: user)

    create :article, user: user, title: "TEST_ARTICLE_1"
    create :article, user: user, title: "TEST_ARTICLE_2"
    create :article, title: "TEST_ARTICLE_3"

    visit articles_path

    expect(page).to have_content "TEST_ARTICLE_1"
    expect(page).to have_content "TEST_ARTICLE_2"
    expect(page).to have_content "TEST_ARTICLE_3"
  end
end
