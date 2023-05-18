FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Lorem ipsum lorem ipsum" }
    user
  end
end
