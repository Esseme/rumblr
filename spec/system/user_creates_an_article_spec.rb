require 'rails_helper'

RSpec.describe "User creates an article" do
  it "shows their amazing content" do
    title = "This is my awesome title"
    content = "My awesome content"
    visit root_path
    fill_in "Title", with: title
    fill_in "Content", with: content
    click_button "Submit"

    expect(page).to have_content title
  end
end
