FactoryBot.define do
  factory :account do
    name {FFaker::Name.name}
    email {FFaker::Internet.email}
    password {"123456"}

    after(:create) do |account|
      create(:patient, account: account)
    end
  end

  factory :patient do
    address {FFaker::Address.full_address}
    birthday {FFaker::Date.birthday(min_age: 18, max_age: 65)}
    image {FFaker::Avatar.image}
    phone_number {Faker::PhoneNumber.phone_number}
  end

  factory :doctor do
    specialist {"Special_list"}
    image {FFaker::Avatar.image}
    phone_number {FFaker::PhoneNumber.phone_number}

    factory :doctor_have_appointments do
      after(:create) do |patient|
        create(:appointment, doctor: doctor)
      end
    end
  end

  factory :appointment do
    patient
    doctor
    time {FFaker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)}
  end
end
