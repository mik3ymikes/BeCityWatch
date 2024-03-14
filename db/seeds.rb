(1..10).each do |i|
    user=User.create(
        username: Faker::Internet.username(specifier:3..20, separators: %w(_)),
        password:'password',
        password_confirmation:'password',
        email: Faker::Internet.email,
        zipcode: 63857
    )

    rand(1..10).times do
        user.alerts.create(
            content: Faker::Lorem.paragraph,
             title:Faker::Lorem.sentence
    
        )

    end

    rand(1..10).times do
        user.created_events.create(
            content: Faker::Lorem.paragraph,
            start_date_time: Faker::Time.forward(days:25, period: :morning),
            end_date_time: Faker::Time.forward(days:25, period: :morning),
             title:Faker::Lorem.sentence
    
        )
    end
end