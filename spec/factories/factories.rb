FactoryBot.define do
  factory :account do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"123456"}
  end

  factory :patient do
    address {Faker::Address.full_address}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65)}
    image {Faker::Avatar.image}
    phone_number {Faker::PhoneNumber.phone_number}
  end

  factory :doctor do
    specialist {"Special_list"}
    image {Faker::Avatar.image}
    phone_number {Faker::PhoneNumber.phone_number}
  end
end
