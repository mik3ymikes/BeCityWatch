FactoryBot.define do
  factory :event do
    user
    content {Faker::Lorem.paragraph}
    start_date_time { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2) }
    end_date_time { Faker::Time.between(from: DateTime.now + 3, to: DateTime.now + 4) }
  end
end
