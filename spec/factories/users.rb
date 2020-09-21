FactoryBot.define do
  factory :user do
    nickname                   { Faker::Name.initials(number: 2) }
    email                      { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password                   { password.to_s + 0.to_s }
    password_confirmation      { password.to_s + 0.to_s }
  end
end
