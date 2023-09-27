require "rails_helper"

RSpec.describe "Guest visits the home page" do
  it "displays a list of articles created by all the users" do
    create :article, title: "TEST_ARTICLE_1"
    create :article, title: "TEST_ARTICLE_2"

    visit root_path

    expect(page).to have_content "TEST_ARTICLE_1"
    expect(page).to have_content "TEST_ARTICLE_2"
  end
end
