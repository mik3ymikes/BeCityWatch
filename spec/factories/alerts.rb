FactoryBot.define do
  factory :alert do
    content {Faker::Lorem.paragraph}
    user
  end
end