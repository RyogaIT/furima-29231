FactoryBot.define do
  factory :user do
    nickname {"User"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    lastname {"山田"}
    firstname {"太郎"}
    lastnamekana {"ヤマダ"}
    firstnamekana {"タロウ"}
    birthday {Faker::Date.birthday}
  end
end