require "rails_helper"

RSpec.describe ApplicationHelper, "#field_with_error" do
  it "there are no errors" do
    user = create(:user)

    field_error = helper.field_with_errors(user, :email)

    expect(field_error).to be_nil
  end

  context "when the field has an error" do
    it "returns div with email error" do
      user = create(:user)
      user.errors.add(:email, "is invalid")
      user.errors.add(:email, "is too long")

      field_error = helper.field_with_errors(user, :email)

      result = '<div class="form_error">Email is invalid, Email is too long</div>'
      expect(field_error).to eq result
    end

    it "returns div with password error" do
      user = create(:user)
      user.errors.add(:password, "cannot be blank")

      field_error = helper.field_with_errors(user, :password)

      result = '<div class="form_error">Password cannot be blank</div>'
      expect(field_error).to eq result
    end
  end
end
