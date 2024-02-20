FactoryBot.define do
  factory :event do
    user { nil }
    content { "MyText" }
    start_date_time { "2024-02-20 14:46:30" }
    end_date_time { "2024-02-20 14:46:30" }
  end
end
