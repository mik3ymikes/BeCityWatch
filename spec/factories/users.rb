FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier:3..20, separators: %w(_)) }
    email {Faker::Internet.email}
    password {'password'}
    zipcode {63857}
  end
end
