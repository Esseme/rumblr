require 'rails_helper'

RSpec.describe "User creates an article" do
  it "shows their amazing content" do
    visit root_path
    fill_in "Title", with: "This is my awesome title"
    fill_in "Content", with: "My awesome content"
    click_button "Submit"

    expect(page).to have_content "This is my awesome title"
    expect(page).to have_content "My awesome content"
  end

  context "user provides wrong form data" do
    it "shows an error on the form" do
    visit root_path
    fill_in "Title", with: ""
    fill_in "Content", with: ""
    click_button "Submit"

    expect(page).to have_content "This is my awesome title"
    expect(page).to have_content "My awesome content"
    end
  end
end
