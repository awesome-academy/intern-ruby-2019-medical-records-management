50.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  password = "123456"
  Account.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

Account.all.each do |account|
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
