FactoryBot.define do
  factory :characteristic do
    name        {Faker::Lorem.characters(number: 10)}
    title       {Faker::Lorem.characters(number: 10)}
  end
end
