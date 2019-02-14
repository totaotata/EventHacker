
FactoryBot.define do
  factory :event do
    title {Faker::Lorem.characters(6)}
    description {Faker::ChuckNorris.fact}
    start_date {Time.now+3.day}
    duration {rand(1..10)*5}
    location {Faker::Address.city}
    price {rand(1..1000)}
    user {FactoryBot.create(:user)}

  end
end
