require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { is_expected.to have_many(:articles) }
    it { is_expected.to have_many(:comments) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end
end
