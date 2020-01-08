40.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  password = "123456"
  Account.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

10.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 41}@gmail.com"
  role = 1
  password = "123456"
  Account.create!(name: name,
    email: email,
    role: role,
    password: password,
    password_confirmation: password)
end

for account in Account.all.take(40)
  address = Faker::Address.full_address
  birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
  image = Faker::Avatar.image
  phone_number = Faker::PhoneNumber.phone_number
  Patient.create!(
    account_id: account.id,
    address: address,
    birthday: birthday,
    image: image,
    phone_number: phone_number)
end

for account in Account.all.limit(10).offset(40)
  specialist = "Special_list"
  image = Faker::Avatar.image
  phone_number = Faker::PhoneNumber.phone_number
  Doctor.create!(
    account_id: account.id,
    specialist: specialist,
    image: image,
    phone_number: phone_number)
end

for doctor in Doctor.all
  for i in 0..30
    working_day = Date.today.beginning_of_month + i.day
    unless working_day.sunday?
      DoctorSchedule.create!(
        doctor_id: doctor.id,
        working_day: working_day)
    end
  end
end
