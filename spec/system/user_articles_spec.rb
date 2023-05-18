require "rails_helper"

RSpec.describe "User views their articles" do
  it "displays a list of articles created by the user" do
    user = create(:user)
    visit root_path(as: user)
    3.times { create(:article, user: user) }
    visit articles_path

    user.articles.each do |article|
      expect(page).to have_content(article.title)
      expect(page).to have_content(article.content)
    end
  end
end
