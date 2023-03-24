require "rails_helper"

RSpec.describe ApplicationHelper, "#field_with_error" do
  context "when the field has an error" do
    it "returns div with email error" do
      user = create(:user)
      user.errors.add(:email, "can't be blank")
      user.errors.add(:email, "is invalid")
      field_error = helper.field_with_errors(user, :email).tr('"', "'")
      result =
        "<div class='form_error'>Email can&#39;t be blank, Email is invalid</div>"

      expect(field_error).to eq result
    end

    it "returns div with password error" do
      user = create(:user)
      user.errors.add(:password, "can't be blank")
      field_error = helper.field_with_errors(user, :password).tr('"', "'")
      result = "<div class='form_error'>Password can&#39;t be blank</div>"

      expect(field_error).to eq result
    end
  end
end
