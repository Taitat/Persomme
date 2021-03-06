FactoryBot.define do
  factory :question do
    title                   {Faker::Lorem.characters(number: 10)}
    content                 {Faker::Lorem.characters(number: 40)}
    genre_id                {2}
    association :user
  end
end
