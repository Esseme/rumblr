FactoryBot.define do
  factory :comment do
    body { "Lorem ipsum" }
    user
    article
  end
end
