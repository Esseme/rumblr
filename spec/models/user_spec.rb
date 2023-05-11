require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { should have_many(:articles) }
  end
end
