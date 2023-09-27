require "rails_helper"

RSpec.describe "Author visits the home page" do
  it "shows a form for creating a new article" do
    user = create :user

    visit root_path as: user

    expect(page).to have_content "New article"
  end
end
