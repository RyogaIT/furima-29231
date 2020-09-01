FactoryBot.define do
  factory :user do
    name {Faker::Name.nickname}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    name {Faker::Name.firstname}
    name {Faker::Name.lastname}
    name {Faker::Name.firstnamekana}
    name {Faker::Name.lastnamekana}
    birthday {Faker::Date.birthday}
  end
end